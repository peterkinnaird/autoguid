require 'railtie' if defined?(Rails)

module Autoguid
  extend ActiveSupport::Concern

    included do
      before_create :generate_autoguid
    end

    def generate_autoguid
      uuid = SecureRandom.uuid
      name = self.is_a?(Module) ? name : self.class.name
      self.guid = name + '-' + uuid
    end

end
