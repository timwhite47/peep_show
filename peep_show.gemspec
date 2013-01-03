$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "peep_show/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "peep_show"
  s.version     = PeepShow::VERSION
  s.authors     = ["Tim White"]
  s.email       = ["timwhite47@gmail.com"]
  s.homepage    = "https://github.com/timwhite47/peep_show"
  s.summary     = "Generate social media previews of your ActiveRecord objects"
  s.description = ""

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.4"

  s.add_development_dependency "sqlite3"
end
