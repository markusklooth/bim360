module Bim360

  # Authentication methods for {Bim360::Client}
  module Authentication

    # Indicates if the client was supplied  Basic Auth
    # username and password
    #
    # @see https://developer.github.com/v3/#authentication
    # @return [Boolean]
    def basic_authenticated?
      !!(@username && @password)
    end

    # Indicates if the client was supplied an OAuth
    # access token
    #
    # @see https://developer.github.com/v3/#authentication
    # @return [Boolean]
    def token_authenticated?
      !!@access_token
    end

    def sign_in

      response = post 'api/login', { username: @username, password: @password}
      @ticket = response[:ticket]
    end

    def sign_out
      post "api/logout"
    end

    # Check is a user is currently signed in.
    #
    # @return [Boolean]
    def signed_in?
      !!@ticket
    end

  end

end