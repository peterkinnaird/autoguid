module Autoguid
  extend ActiveSupport::Concern
  require 'railtie' if defined?(Rails)

  included do
    before_create :generate_guid
  end

  def generate_guid
    uuid = SecureRandom.uuid
    name = self.is_a?(Module) ? name : self.class.name
    self.guid = name + '-' + uuid
  end

end

class AutoGuidMigrator < ActiveRecord::Migration
  def up
    Rails.application.eager_load!
    models = ActiceRecord::Base.direct_descendants if
    ActiveRecord::Base.direct_descendants.each do |model|
      model.reset_column_information
      add_column(model, :guid, :string, :unique => true) unless model.column_names.include?('guid')
      add_index(model, :guid)
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