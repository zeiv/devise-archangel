begin
  require "archangel"
  require "archangel/version"
rescue LoadError
  warn "Could not load 'archangel'. Please ensure you have the archangel gem >= 1.0.0 installed and listed in your Gemfile."
  raise
end

unless Archangel::VERSION =~ /^1\./
  raise "You are using an old Archangel version, please ensure you have 1.0.0.pr2 version or later installed."
end

# Clean up the default path_prefix. It will be automatically set by Devise.
Archangel.config.path_prefix = nil

Archangel.config.on_failure = Proc.new do |env|
  env['devise.mapping'] = Devise::Mapping.find_by_path!(env['PATH_INFO'], :path)
  controller_name  = ActiveSupport::Inflector.camelize(env['devise.mapping'].controllers[:archangel_callbacks])
  controller_klass = ActiveSupport::Inflector.constantize("#{controller_name}Controller")
  controller_klass.action(:failure).call(env)
end

module Devise
  module Archangel
    autoload :Config,      "devise/archangel/config"
    autoload :UrlHelpers,  "devise/archangel/url_helpers"
  end
end
