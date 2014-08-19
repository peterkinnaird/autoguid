namespace :autoguid do
	task :install do
    path = Rails.root.to_s + "/config/initializers/autoguid.rb"
    template_path = File.expand_path('../../initializer.rb',__FILE__)
    template = File.open(template_path)
    File.open(path, "w") do |f|
      IO.copy_stream(template,f)
    end
	end
  namespace :migrate do
    task :up => :environment do
      init = Initializer.new
      init.config
      init.up
    end
    task :drop_all => :environment do
      init = Initializer.new
      init.config
      init.drop_all
    end
  end
end
