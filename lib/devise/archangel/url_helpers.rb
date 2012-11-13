module Devise
  module Archangel
    module UrlHelpers
      def self.define_helpers(mapping)
      end

      def archangel_authorize_path(resource_or_scope, *args)
        scope = Devise::Mapping.find_scope!(resource_or_scope)
        send("#{scope}_archangel_authorize_path", *args)
      end

      def archangel_callback_path(resource_or_scope, *args)
        scope = Devise::Mapping.find_scope!(resource_or_scope)
        send("#{scope}_archangel_callback_path", *args)
      end
    end
  end
end
