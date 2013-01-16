require 'wordpressed/constraints/routes'

module Wordpressed
  mattr_accessor :wordpress_name
  @@wordpress_name = nil

  #mattr_accessor :webhook_url
  #@@webhook_url = "#{wordpress_name}/wordpressed"

  #mattr_accessor :feed_url
  #@@feed_url = "#{wordpress_url}/feed/"

  mattr_accessor :layout
  @@layout = 'application'

  def self.setup
    yield self
  end

  require 'wordpressed/engine' if defined?(Rails)

  def self.generate_archive_links(collection)
    []
  end

end
