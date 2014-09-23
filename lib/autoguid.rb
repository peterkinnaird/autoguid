require 'railtie' if defined?(Rails)

module Autoguid
  extend ActiveSupport::Concern

    included do
      before_create do
        save_autoguid( generate_autoguid )
      end
    end

    def save_autoguid(guid)
      self.guid = guid
    end

    def generate_autoguid
      name = self.is_a?(Module) ? name : self.class.name
      return name + '-' + SecureRandom.uuid
    end

    def self.backfill(model)
      puts 'Backfilling ' + model.name
      model.all.each do |row|
        puts 'Updating a record'
        row.guid = row.generate_autoguid
        row.save
      end
    end
end
