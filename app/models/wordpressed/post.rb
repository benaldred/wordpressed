module Wordpressed
  class Post < ActiveRecord::Base
    attr_accessible :content, :excerpt, :slug, :status, :title, :wp_id, :wp_url


    #
    def self.create_from_json!(data)
      Rails.logger.debug("=============================")
      Rails.logger.debug data.inspect

      if find_by_slug(data["slug"])
        # update?
      else
        post = new(data.slice('title', 'content', 'excerpt', 'slug', 'status'))
        post.wp_url = data['URL']
        post.wp_id = data['ID']
        Rails.logger.debug post
        post.save!
      end
    end
  end
end
