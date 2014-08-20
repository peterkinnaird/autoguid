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
    task :backfill => :environment do
      require 'autoguid'
      Rails.application.eager_load!
      ActiveRecord::Base.direct_descendants.each do |model|
        puts model
        model.reset_column_information
        Autoguid.backfill(model) if model.columns_hash['guid']
      end
    end
  end

end
