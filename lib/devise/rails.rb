require 'devise/rails/routes'

module Devise
  class Engine < ::Rails::Engine
    
    initializer "devise.archangel" do |app|
      Devise.archangel_configs.each do |provider, config|
        app.middleware.use config.strategy_class, *config.args do |strategy|
          config.strategy = strategy
        end
      end

      if Devise.archangel_configs.any?
        Devise.include_helpers(Devise::Archangel)
      end
    end
  end
end
