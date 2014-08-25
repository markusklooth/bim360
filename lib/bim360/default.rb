require "bim360/version" unless defined?(Bim360::VERSION)
require 'bim360/response/raise_error'

module Bim360

  # Default configuration options for {Client}
  module Default

    # Default API endpoint
    API_ENDPOINT = "https://manage.velasystems.com".freeze

    # Default User Agent header string
    USER_AGENT   = "BIM360-Field Ruby Gem #{Bim360::VERSION}".freeze


    # Default Faraday middleware stack
    MIDDLEWARE = Faraday::RackBuilder.new do |builder|
      builder.use Bim360::Response::RaiseError
      builder.adapter Faraday.default_adapter
    end


    class << self

      # Configuration options
      # @return [Hash]
      def options
        Hash[Bim360::Configurable.keys.map{|key| [key, send(key)]}]
      end

      # Default access token from ENV
      # @return [String]
      def access_token
        ENV['BIM360_ACCESS_TOKEN']
      end

      # Default API endpoint from ENV or {API_ENDPOINT}
      # @return [String]
      def api_endpoint
        ENV['BIM360_API_ENDPOINT'] || API_ENDPOINT
      end

      # Default BIM360-Field username for Basic Auth from ENV
      # @return [String]
      def username
        ENV['BIM360_USERNAME']
      end

      # Default BIM360-Field password for Basic Auth from ENV
      # @return [String]
      def password
        ENV['BIM360_PASSWORD']
      end

      def ticket
        ENV['BIM360_TICKET']
      end

      # Default proxy server URI for Faraday connection from ENV
      # @return [String]
      def proxy
        ENV['BIM360_PROXY']
      end

      # Default options for Faraday::Connection
      # @return [Hash]
      def connection_options
        {
          :headers => {
            # :accept => default_media_type,
            :user_agent => user_agent
          }
        }
      end

      
      # Default middleware stack for Faraday::Connection
      # from {MIDDLEWARE}
      # @return [String]
      def middleware
        MIDDLEWARE
      end


      # Default User-Agent header string from ENV or {USER_AGENT}
      # @return [String]
      def user_agent
        ENV['BIM360_USER_AGENT'] || USER_AGENT
      end

      def project_id
        ENV['BIM360_PROJECT_ID']
      end

    end

  end
end