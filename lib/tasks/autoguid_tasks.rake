namespace :autoguid do
	task :install do
    puts 'Copying autoguid initializer to your app'
    path = Rails.root.to_s + "/config/initializers/autoguid.rb"
    template_path = File.expand_path('../../initializer.rb',__FILE__)
    template = File.open(template_path)
    File.open(path, "w") do |f|
      IO.copy_stream(template,f)
    end
	end
  namespace :migrate do
    task :up => :environment do
      'Migrating database up for autoguids'
      init = Initializer.new
      init.config
      init.up
    end
    task :drop_all => :environment do  
      'Dropping all autoguids'
      init = Initializer.new
      init.config
      init.drop_all
    end
    task :backfill => :environment do
      puts 'Backfilling all autoguids'
      require 'autoguid'
      Migrator.all_models.each do |model|
        puts 'Backfilling: ' + model.name
        model.reset_column_information
        Autoguid.backfill(model) if model.columns_hash['guid']
      end
    end
  end

end
