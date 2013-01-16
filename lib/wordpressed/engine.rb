module Wordpressed
  class Engine < ::Rails::Engine
    isolate_namespace Wordpressed

    config.generators do |g|
      g.test_framework      :rspec,        :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end

    config.to_prepare do
      ApplicationController.helper(Wordpressed::ApplicationHelper)
    end
  end
end
