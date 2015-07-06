$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sack/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sack"
  s.version     = Sack::VERSION
  s.authors     = ["David North"]
  s.email       = ["davidnorth@gmail.com"]
  s.summary     = "Single Action Controllers, oK?"
  s.description = "Experimenting with Rails controllers."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "deterministic", "0.15.1"

  s.add_development_dependency "sqlite3"
end
