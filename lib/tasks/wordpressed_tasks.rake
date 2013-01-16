require 'open-uri'
require 'json'


namespace :wordpressed do

  desc "Import posts from the blog"
  task :import => :environment do
    raise "You need to set the Wordpressed.wordpress_url in the initializer" if Wordpressed.wordpress_url.nil?
    response  = JSON.parse(open('https://public-api.wordpress.com/rest/v1/sites/#{Wordpressed.wordpress_url}/posts').read)
    response["posts"].each do |post|
      Wordpressed::Post.find_or_create_from_json(post)
    end
  end


  desc "Clear posts"
  task :clear => :environment do
    Wordpressed::Post.delete_all
  end
end