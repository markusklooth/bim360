require 'builder'
require 'multi_json'
# require 'rest_client'
require 'cgi'

require "bim360/client"
require "bim360/default"


module Bim360

  class << self

    include Bim360::Configurable

    # API client based on configured options {Configurable}
    #
    # @return [Bim360::Client] API wrapper
    def client
      # options
      @client = Bim360::Client.new(options) unless defined?(@client) && @client.same_options?(options)
      @client
    end

    # @private
    def respond_to_missing?(method_name, include_private=false)
      client.respond_to?(method_name, include_private)
    end 

  private

    def method_missing(method_name, *args, &block)
      return super unless client.respond_to?(method_name)
      client.send(method_name, *args, &block)
    end


  end
end

Bim360.setup
