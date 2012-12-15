begin
  require "archangel"
  require "archangel/version"
rescue LoadError
  warn "Could not load 'archangel'. Please ensure you have the archangel gem >= 0.0.3 installed and listed in your Gemfile."
  raise
end

#~ unless Archangel::VERSION =~ /^1\./
  #~ raise "You are using an old Archangel version, please ensure you have 0.0.3 version or later installed."
#~ end

# Clean up the default path_prefix. It will be automatically set by Devise.
Archangel.config.path_prefix = nil

Archangel.config.on_failure = Proc.new do |env|
  env['devise.mapping'] = Devise::Mapping.find_by_path!(env['PATH_INFO'], :path)
  controller_name  = ActiveSupport::Inflector.camelize(env['devise.mapping'].controllers[:archangel_callbacks])
  controller_klass = ActiveSupport::Inflector.constantize("#{controller_name}Controller")
  controller_klass.action(:failure).call(env)
end

module Devise

  # Set the archangel path prefix so it can be overriden when
  # Devise is used in a mountable engine
  mattr_accessor :archangel_path_prefix
  @@archangel_path_prefix = nil

  # archangel configurations.
  mattr_reader :archangel_configs
  @@archangel_configs = ActiveSupport::OrderedHash.new

  def self.archangel_providers
    archangel_configs.keys
  end

  # Specify an archangel provider.
  #
  #   config.archangel :github, APP_ID, APP_SECRET
  #
  def self.archangel(provider, *args)
    @@helpers << Devise::Archangel::UrlHelpers
    config = Devise::Archangel::Config.new(provider, args)
    @@archangel_configs[config.strategy_name.to_sym] = config
  end

  module Archangel
    autoload :Config,      "devise/archangel/config"
    autoload :UrlHelpers,  "devise/archangel/url_helpers"
  end
end

Devise.add_module(:archangelable, :controller => :archangel_callbacks,  :route => :archangel_callback)
