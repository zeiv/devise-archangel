require 'devise/archangel'

module Devise
  module Models
    # Adds Archangel support to your model.
    #
    # == Options
    #
    # Oauthable adds the following options to devise_for:
    #
    #   * +archangel_providers+: Which providers are avaialble to this model. It expects an array:
    #
    #       devise_for :database_authenticatable, :archangelable, :archangel_providers => [:twitter]
    #
    module Archangelable
      extend ActiveSupport::Concern

      def self.required_fields(klass)
        []
      end

      module ClassMethods
        Devise::Models.config(self, :archangel_providers)
      end
    end
  end
end
