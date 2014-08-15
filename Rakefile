begin
  require 'bundler/setup'
  require 'rspec/core/rake_task'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rdoc/task'

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Autoguid'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end




Bundler::GemHelper.install_tasks

# Default directory to look in is /specs
RSpec::Core::RakeTask.new(:test) do |task|
  #task.rspec_opts = ['--color', '--format', 'nested']
  # task.rspec_opts = '--tag'
end


task default: :test
