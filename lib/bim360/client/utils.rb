module Bim360
  class Client
    module Utils

      def objects_from_response(response, klass)

        if response.is_a?(Array)
          objects_from_array(response, klass)
        elsif response.is_a?(Hash) || response.is_a?(Sawyer::Resource)
          klass.new(response)
        end

      end

      def objects_from_array(array, klass)
        # RedditKit::Comment
        array.map do |thing|
          klass.new(thing)
        end
      end

      # def object_class_from_response(thing)

      # end

      # def objects_from_response(request_type, path, parameters = {})
      #   response = send(request_type.to_sym, path, parameters)
      #   body = response[:body]

      #   if body.is_a?(Hash) and body[:kind] == 'Listing'
      #     data = body[:data]
      #     results = objects_from_listing(body)

      #     RedditKit::PaginatedResponse.new(data[:before], data[:after], results)
      #   elsif body.is_a?(Array)
      #     objects_from_array body
      #   elsif body.is_a?(Hash)
      #     objects_from_array body[:data]
      #   end
      # end


    end
  end
end