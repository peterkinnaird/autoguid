$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "autoguid/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "autoguid"
  s.version     = Autoguid::VERSION
  s.authors     = ["Peter Kinnaird"]
  s.email       = ["peter@hacktivism.cc"]
  s.homepage    = "http://hacktivism.cc"
  s.summary     = "Autoguid adds human readable uuids to your models"
  s.description = "Description of Autoguid."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.4"

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency "sqlite3"
end
