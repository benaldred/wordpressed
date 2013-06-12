$:.push File.expand_path("../lib", __FILE__)


# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "wordpressed"
  s.version     = File.read('./VERSION')
  s.authors     = ["Ben Aldred"]
  s.email       = ["ben@tinycodefactory.com"]
  s.homepage    = "https://github.com/benaldred/wordpressed"
  s.summary     = "Include a wordpress.com blog in your app"
  s.description = "Harness the power of wordpress right in your app"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails",                     "~> 3.2"
  s.add_dependency "httparty"
  s.add_dependency "version",                    "1.0.0"
end
