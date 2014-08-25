require 'faraday'
require 'bim360/error'

module Bim360
  # Faraday response middleware
  module Response

    # This class raises an Bim360-flavored exception based
    # HTTP status codes returned by the API
    class RaiseError < Faraday::Response::Middleware

      private

      def on_complete(response)
        if error = Bim360::Error.from_response(response)
          raise error
        end
      end
    end
  end
end
