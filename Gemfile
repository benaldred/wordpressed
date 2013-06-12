source "http://rubygems.org"

# Declare your gem's dependencies in wordpressed.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# jquery-rails is used by the dummy application
gem "jquery-rails"

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'debugger'
group :test, :development do
  gem 'sqlite3',          '1.3.7'
  gem 'guard',            '1.7.0'
  gem 'guard-rspec',      '2.5.3'
  gem 'rspec-rails',      '2.13.0'
  gem "database_cleaner"
  gem 'factory_girl_rails'
  gem 'rb-inotify',       '0.9.0', require: false
  gem 'rb-fsevent',       '0.9.3', require: false
end

