module ActionDispatch::Routing
  class Mapper
    alias :as :devise_scope

    protected

      def devise_archangel_callback(mapping, controllers) #:nodoc:
        path, @scope[:path] = @scope[:path], nil
        path_prefix = Devise.archangel_path_prefix || "/#{mapping.path}/auth".squeeze("/")
        set_archangel_path_prefix!(path_prefix)

        providers = Regexp.union(mapping.to.archangel_providers.map(&:to_s))

        match "#{path_prefix}/:provider",
          :constraints => { :provider => providers },
          :to => "#{controllers[:archangel_callbacks]}#passthru",
          :as => :archangel_authorize

        match "#{path_prefix}/:action/callback",
          :constraints => { :action => providers },
          :to => controllers[:archangel_callbacks],
          :as => :archangel_callback
      ensure
        @scope[:path] = path
      end

      def set_archangel_path_prefix!(path_prefix) #:nodoc:
        if ::Archangel.config.path_prefix && ::Archangel.config.path_prefix != path_prefix
          raise "Wrong Archangel configuration. If you are getting this exception, it means that either:\n\n" \
            "1) You are manually setting Archangel.config.path_prefix and it doesn't match the Devise one\n" \
            "2) You are setting :archangelable in more than one model\n" \
            "3) You changed your Devise routes/Archangel setting and haven't restarted your server"
        else
          ::Archangel.config.path_prefix = path_prefix
        end
      end

  end
end
