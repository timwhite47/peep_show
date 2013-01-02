$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "peep_show/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "peep_show"
  s.version     = PeepShow::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of PeepShow."
  s.description = "TODO: Description of PeepShow."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.4"

  s.add_development_dependency "sqlite3"
end
