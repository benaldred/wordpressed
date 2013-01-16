module Wordpressed
  require 'ostruct'
  require 'open-uri'

  class Post < ActiveRecord::Base
    attr_accessible :content, :excerpt, :slug, :status, :title, :wp_id, :wp_url

    scope :published, where(:status => 'published').order('created_at ASC')
    scope :recent, limit(5)

    def self.find_post(slug)
      published.where("slug = ?", slug).first
    end

    def self.find_or_create_from_json(data)
      post = find_by_slug(data["slug"])
      if post
        post
      else
        post = build_from_json(data)
        post.save
        post
      end
    end

    def self.archive_links
      self.by_month.map do |p|
        date = DateTime.parse("#{p}-1")
        ::OpenStruct.new(
          title: date.strftime("%B %Y"),
          month: date.strftime("%m"),
          year: date.strftime("%Y"))
      end
    end

    def self.sync!
      raise "You need to set the Wordpressed.wordpress_url in the initializer" if Wordpressed.wordpress_name.nil?
      response  = JSON.parse(open("https://public-api.wordpress.com/rest/v1/sites/#{Wordpressed.wordpress_name}.wordpress.com/posts").read)
      response["posts"].each do |post|
        Wordpressed::Post.sync_or_create_from_json(post)
      end
    end

    def self.sync_or_create_from_json(data)
      post = find_or_create_from_json(data)

      if !post.new_record?
        # check if post is dirty
        # for now we overwrite
        post.delete
        post = build_from_json(data)
        post.save!
      end
    end

    scope :within_month, lambda { |year, month|
      start_of_month = Date.new(year.to_i, month.to_i, 1)
      within_dates(start_of_month, start_of_month.end_of_month)
    }

    scope :within_year, lambda { |year|
      start_of_year = Date.new(year.to_i, 1, 1)
      within_dates(start_of_year, start_of_year.end_of_year)
    }

    scope :within_dates, lambda { |start_date, end_date|
      if start_date.present? && end_date.present?
        where(:created_at => (start_date.to_date)..(end_date.to_date))
      elsif start_date.present?
        where("created_at >= :start_date", start_date: start_date)
      elsif end_date.present?
        where("created_at <= :end_date", end_date: end_date)
      else
        scoped
      end
    }

    # return posts grouped by :year/:month
    def self.by_month
      order("created_at ASC").group_by(&:month_and_year)
    end

    def published?
      self.status == "published"
    end

    def url
      wp_url.gsub("http://leanstartco.wordpress.com", "")
    end

    def month_and_year
      created_at.strftime("%Y-%m")
    end

    def to_permalink_params
      year, month = month_and_year.split('-')
      {id: self.slug, month: month, year: year}
    end

    private

      def self.build_from_json(data)
        post = new(data.slice('title', 'content', 'excerpt', 'slug'))
        post.wp_url = data['URL']
        post.wp_id = data['ID']
        post.created_at = data['date']
        post.updated_at = data['modified']
        post.status = (data['status'] == 'publish') ? 'published' : data['status']
        post
      end
  end
end
