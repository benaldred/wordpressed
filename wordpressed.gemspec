$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "wordpressed/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "wordpressed"
  s.version     = Wordpressed::VERSION
  s.authors     = ["Ben Aldred"]
  s.email       = ["ben@tinycodefactory.com"]
  s.homepage    = "https://github.com/benaldred/wordpressed"
  s.summary     = "Include a wordpress.com blog in your app"
  s.description = "Harness the power of wordpress right in your app"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.2"
  s.add_dependency "httparty"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
end
