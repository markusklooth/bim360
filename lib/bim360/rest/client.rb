module Bim360
  module REST

    class Client
      include Bim360::Util

      API_VERSION = '2010-04-01'

      DEFAULTS = {
        :host => 'https://manage.velasystems.com',
        :version => "v1",
        :port => 443,
        :use_ssl => true,
        :ssl_verify_peer => true,
        # :ssl_ca_file => File.dirname(__FILE__) + '/../../../conf/cacert.pem',
        :timeout => 30,
        :proxy_addr => nil,
        :proxy_port => nil,
        :proxy_user => nil,
        :proxy_pass => nil,
        :retry_limit => 1,
      }

      attr_reader :token_id, :config, :account, :accounts, :last_request,
        :last_response

      def initialize(username, password, options={})
        @username, @password = username.strip, password.strip
        @config = DEFAULTS.merge! options
        # set_up_connection
        authenticate
      end

      def inspect # :nodoc:
        "<Bim360::REST::Client @token=#{@token_id}>"
      end


      def connect_and_send

      end

      def get(path, params = {})
        # path     = "#{@config[:host]}/fieldapi/#{path}/#{@config[:version]}"

        path            = "#{@config[:host]}/api/#{path}"
        params[:ticket] = @token_id
        # puts path
        # response = RestClient.get(path, :params => {:ticket => @token_id})
        # path << "?#{url_encode(params)}"

        response = RestClient.get(path, :params => params)
        result    = MultiJson.load(response.body, :symbolize_keys => true)

        # 4689d194-0a74-11e3-89a6-02cc3afa57bd

      end

      def new_get(path, params = {})
        path     = "#{@config[:host]}/fieldapi/#{path}/#{@config[:version]}"
        params[:ticket] = @token_id

        # puts path
        # puts MultiJson.dump(params)
        response = RestClient.get(path, :params => params)
        result    = MultiJson.load(response.body, :symbolize_keys => true)


      end

      private

      def authenticate 
        
        begin

        response = RestClient.post("#{@config[:host]}/api/login",
          :username => @username, 
          :password => @password)

        # @last_response = response
        # if response.kind_of? RestClient::ResourceNotFound
          # puts "error"
          # raise Bim360::REST::ServerError
        # end

        rescue => e
          # puts "error #{e}" 
          # puts e.kind?
          # raise if request.class == Net::HTTP::Post
          # if retries_left > 0 then retries_left -= 1; retry else raise end
        end


        result    = MultiJson.load(response.body, :symbolize_keys => true)


        @token_id = result[:ticket]



      end

    end


  end
end
