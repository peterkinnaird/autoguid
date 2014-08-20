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
      uuid = SecureRandom.uuid
      name = self.is_a?(Module) ? name : self.class.name
      return name + '-' + uuid
    end

    def backfill(model)
      puts "Backfilling " + model
      model.all.each do |row|
        puts "Found a row"
        row.guid = generate_autoguid
        row.save
      end
    end
end
