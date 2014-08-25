require 'sawyer'
require 'bim360/arguments'
require "bim360/configurable"
require "bim360/authentication"
require "bim360/util"
require "bim360/client/utils"
require "bim360/client/checklists"
require "bim360/client/tasks"
require "bim360/client/issues"
require "bim360/client/projects"

require "bim360/filters"


module Bim360

  class Client
    include Bim360::Util
    include Bim360::Authentication
    include Bim360::Configurable
    include Bim360::Client::Projects
    include Bim360::Client::Checklists
    include Bim360::Client::Tasks
    include Bim360::Client::Issues
    include Bim360::Client::Utils


    API_VERSION = '2010-04-01'

    # attr_reader :token_id, :config, :account, :accounts, :last_request,
    #   :last_response

    def initialize(options = {})

      # Use options passed in, but fall back to module defaults
      Bim360::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || Bim360.instance_variable_get(:"@#{key}"))
      end

      sign_in if basic_authenticated?
    end

    # Compares client options to a Hash of requested options
    #
    # @param opts [Hash] Options to compare with current client options
    # @return [Boolean]
    def same_options?(opts)
      opts.hash == options.hash
    end


    def inspect # :nodoc:

      inspected = super

      # mask password
      inspected = inspected.gsub! @password, "*******" if @password
      # Only show last 4 of token, secret
      if @access_token
        inspected = inspected.gsub! @access_token, "#{'*'*36}#{@access_token[36..-1]}"
      end
      # if @client_secret
      #   inspected = inspected.gsub! @client_secret, "#{'*'*36}#{@client_secret[36..-1]}"
      # end

      inspected
    end

    # Hypermedia agent for the BIM360-Field API
    #
    # @return [Sawyer::Agent]
    def agent
      @agent ||= Sawyer::Agent.new(api_endpoint, sawyer_options) do |http|
        # http.headers[:accept] = default_media_type
        http.headers[:content_type] = "application/json"
        http.headers[:user_agent] = user_agent

        # if 
        # if basic_authenticated?
          # http.basic_auth(@login, @password)
        # elsif token_authenticated?
        #   http.authorization 'token', @access_token
        # end
      end
    end

    # Set username for authentication
    #
    # @param value [String] Bim360-field username
    def username=(value)
      reset_agent
      @username = value
    end

    # Set password for authentication
    #
    # @param value [String] Bim360-field password
    def password=(value)
      reset_agent
      @password = value
    end

    # Set OAuth access token for authentication
    #
    # @param value [String] 40 character Bim360-field API OAuth access token
    def access_token=(value)
      reset_agent
      @access_token = value
    end

    # Make a HTTP GET request
    #
    # @param url [String] The path, relative to {#api_endpoint}
    # @param options [Hash] Query and header params for request
    # @return [Sawyer::Resource]
    def get(url, options = {})
      request :get, url, options
    end

    def post(url, options = {})
      request :post, url, options
    end

    def put(url, options = {})
      request :put, url, options
    end

    def patch(url, options = {})
      request :patch, url, options
    end

    def delete(url, options = {})
      request :delete, url, options
    end

    # Response for last HTTP request
    #
    # @return [Sawyer::Response]
    def last_response
      @last_response if defined? @last_response
    end



    # def get(path, params = {})
      # path     = "#{@config[:host]}/fieldapi/#{path}/#{@config[:version]}"

      # path            = "#{@config[:host]}/api/#{path}"
      # params[:ticket] = @token_id

      # response = RestClient.get(path, :params => params)
      # result    = MultiJson.load(response.body, :symbolize_keys => true)


    # end

    #result    = MultiJson.load(response.body, :symbolize_keys => true)

    private

    def reset_agent
      @agent = nil
    end

    # Make a HTTP Request
    #
    # @param method [Symbol] Http method 
    # @param path [String] path relative to {#api_endpoint}
    # @param options [Hash] Query and header params for request
    # @return [Sawyer::Resource]

    def request(method, path, data, options = {})
      if data.is_a?(Hash)
        options[:query]   = data.delete(:query) || {}
        options[:headers] = data.delete(:headers) || {}
        if accept = data.delete(:accept)
          options[:headers][:accept] = accept
        end

        if method==:get
          options[:query].merge!(data)
          data = {}
        end

      end



      if signed_in?
        case method
        when :get

          options[:query].merge!({ticket: @ticket})
        else
          data.merge!({ticket: @ticket})
        end          
      end

      @last_response = response = agent.call(method, URI::Parser.new.escape(path.to_s), data, options)
      response.data
    end


    def sawyer_options
      opts = {
        :links_parser => Sawyer::LinkParsers::Simple.new
      }
      conn_opts = @connection_options
      conn_opts[:builder] = @middleware if @middleware
      conn_opts[:proxy] = @proxy if @proxy
      opts[:faraday] = Faraday.new(conn_opts)

      opts
    end



    def authenticate 
      

      # response = RestClient.post("#{@config[:host]}/api/login",
      #   :username => @username, 
      #   :password => @password)


      # result    = MultiJson.load(response.body, :symbolize_keys => true)


      # @token_id = result[:ticket]



    end

  end


end
