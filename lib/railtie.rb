require 'autoguid'
require 'rails'

module Autoguid
  class Railtie < Rails::Railtie
    rake_tasks do
      load "tasks/autoguid_tasks.rake"
    end
  end
end