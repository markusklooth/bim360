module Bim360
  module REST

    class Filters

      # :position, :created_at, :container, :conditions, :roles, 
      # :updated_by, :name, :updated_at, :created_by, :filter_id

      
      # conditions: :identifier=>"status", :values=>"Closed", :sort_field=>false, :sort_direction=>"ASC", :operation=>"eq"

      def initialize(client, params={})
        @client = client
        @path = "filters"
      end

      def get()

      end

      def list()
        response = @client.get @path, params, full_path

      end

    end

  end
end
