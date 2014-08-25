module Bim360
  module Configurable
    
    attr_accessor :access_token, :middleware, :proxy, :user_agent, :connection_options, :ticket, :project_id
    attr_writer :password, :api_endpoint, :username

    # Define static methods
    class << self
      def keys
        @keys ||= [
          :access_token,
          :api_endpoint,
          :connection_options,
          :middleware,
          :password,
          :project_id,
          :proxy,
          :user_agent,
          :username,
          :ticket
        ]
      end
    end

    # Set configuration options using a block
    def configure
      yield self
    end

    # Reset configuration options to default values
    def reset!
      Bim360::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", Bim360::Default.options[key])
      end
      self
    end
    alias setup reset!

    def api_endpoint
      File.join(@api_endpoint, "")
    end

  private

    def options
      Hash[Bim360::Configurable.keys.map{|key| [key, instance_variable_get(:"@#{key}")]}]
    end

  
  end  
end