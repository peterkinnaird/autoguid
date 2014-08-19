class Migrator < ActiveRecord::Migration

    attr_accessor :config

    def up
      puts config
      Rails.application.eager_load!
      models = Array.new
      whitelist = Array.new
      if ( @config[:all] )
        whitelist = ActiveRecord::Base.direct_descendants if @config[:all]
      elsif ( @config[:whitelist] )
        puts "Got into Whitelist"
        models = ActiveRecord::Base.direct_descendants
        models.each do |m|
          puts "Checking for model " + m.name + " in whitelist "
          whitelist.push(m) if @config[:whitelist].include?(m.name)
        end
      elsif ( @config[:blacklist] )
        puts "Processing by blacklist"
        whitelist = ActiveRecord::Base.direct_descendants
        whitelist.each do |m|
          puts "Checking for model " + m.name + " in blacklist "
          whitelist.delete(m) if @config[:blacklist].include?(m.name)
        end
      end
      puts whitelist
      whitelist.each do |model|
        puts "Processing " + model.name
        model.reset_column_information
        add_column(model, :guid, :string, :unique => true) unless column_exists?(model, :guid)
        add_index(model, :guid) if @config[:indices] && !index_exists?(model, :guid)
      end
    end

    def down
      Rails.application.eager_load!
      ActiveRecord::Base.direct_descendants.each do |model|
        model.reset_column_information
        remove_index(model, :guid) if index_exists?(model, :guid)
        remove_column(model, :guid) if column_exists?(model, :guid)
      end
    end

end