ENV['RAILS_ENV'] ||= 'test'

require File.expand_path("../dummy/config/environment.rb",  __FILE__)

require 'rails/test_help'
require 'rspec/rails'
require 'rspec/autorun'
require 'factory_girl_rails'

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

require 'database_cleaner'

RSpec.configure do |config|
  require 'rspec/expectations'
  config.include RSpec::Matchers

  config.mock_with :rspec
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"


  config.before(:each, type: :controller) { @routes = Wordpressed::Engine.routes }
  config.before(:each, type: :routing)    { @routes = Wordpressed::Engine.routes }

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end


  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

def wordpress_json
  # from https://public-api.wordpress.com/rest/v1/sites/{blog.url}/posts
  json = JSON.parse(
  '{
    "ID": 11,
    "author": {
      "ID": 43165215,
      "email": false,
      "name": "leanstartco",
      "URL": "http://leanstartco.wordpress.com",
      "avatar_URL": "http://0.gravatar.com/avatar/0536054f1ec255ff8fad95377d932341?s=96&d=identicon&r=G",
      "profile_URL": "http://en.gravatar.com/leanstartco"
    },
    "date": "2013-01-11T08:06:25+00:00",
    "modified": "2013-01-11T10:06:25+00:00",
    "title": "Test post",
    "URL": "http://leanstartco.wordpress.com/2013/01/11/test-post/",
    "short_URL": "http://wp.me/p2XFPI-b",
    "content": "<p>this is a test post</p>\n",
    "excerpt": "<p>this is a test post</p>\n",
    "slug": "test-post",
    "status": "publish",
    "password": "",
    "parent": false,
    "type": "post",
    "comments_open": true,
    "pings_open": true,
    "comment_count": 0,
    "like_count": 0,
    "featured_image": "",
    "format": "standard",
    "geo": false,
    "publicize_URLs": [],
    "tags": {},
    "categories": {
      "Uncategorized": {
        "name": "Uncategorized",
        "slug": "uncategorized",
        "description": "",
        "post_count": 2,
        "parent": 0,
        "meta": {
          "links": {
            "self": "https://public-api.wordpress.com/rest/v1/sites/43774834/categories/slug:uncategorized",
            "help": "https://public-api.wordpress.com/rest/v1/sites/43774834/categories/slug:uncategorized/help",
            "site": "https://public-api.wordpress.com/rest/v1/sites/43774834"
          }
        }
      }
    },
    "attachments": {},
    "meta": {
      "links": {
        "self": "https://public-api.wordpress.com/rest/v1/sites/43774834/posts/11",
        "help": "https://public-api.wordpress.com/rest/v1/sites/43774834/posts/11/help",
        "site": "https://public-api.wordpress.com/rest/v1/sites/43774834",
        "replies": "https://public-api.wordpress.com/rest/v1/sites/43774834/posts/11/replies/",
        "likes": "https://public-api.wordpress.com/rest/v1/sites/43774834/posts/11/likes/"
      }
    }
  }')
end