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
  s.description = "Autoguid lets you trivially add human readable uuids to all
   your models, a whitelisted set of models, or a blacklisted set.
   Indices are automatically created based on a configuration option.
   There's also a rake task that will backfill these uuids into resources that
   have already been created.
   To get started, include the gem file, run `bundle install`, then run
   `rake autoguid:install`. From there, edit the config/initializers/autoguid.rb
   file to specifcy your configuration. Next, migrate your tables with
   `rake autoguid:migrate:up` and `rake autoguid:migrate:backfill` as required.
   `rake autoguid:migrate:drop_all` will drop all autoguid generated columns and
   the data in them. You can always change the config/initializers/autoguid.rb file
   and rerun `rake autoguid:migrate:up` to add autoguid to new models."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.4", '>= 4.1.4'

  s.add_development_dependency 'rake', "~> 10.1.0", '>= 10.1.0'
  s.add_development_dependency 'rspec', "~> 3.0.0", '>= 3.0.0'
  s.add_development_dependency "sqlite3", "~> 1.3.9", '>= 1.3.9'
end
