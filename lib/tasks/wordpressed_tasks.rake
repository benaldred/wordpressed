require 'open-uri'
require 'json'


namespace :wordpressed do

  desc "Import posts from the blog"
  task :import => :environment do
    response  = JSON.parse(open('https://public-api.wordpress.com/rest/v1/sites/leanstartco.wordpress.com/posts').read)
    response["posts"].each do |post|
      Wordpressed::Post.create_from_json!(post)
    end
  end


  desc "Clear posts"
  task :clear => :environment do
    Wordpressed::Post.delete_all
  end
end