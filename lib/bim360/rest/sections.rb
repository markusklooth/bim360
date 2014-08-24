module Bim360
  module REST

    class Sections

      # Group:
      # :section_name
      # :items

      # Items: Array of items inside :items
      # :position
      # :display_number
      # :is_conforming      "N/A"
      # :created_at
      # :attachments
      # :display_type       "drop-down", 
      # :issues
      # :comment
      # :possible_values    ["Pass", "Fail", "N/A"]
      # :response
      # :question_text
      # :created_by
      # :updated_at
      # :id
      # :spec_ref


      def initialize(client, params={})
        @client   = client
        @path     = "checklists"
        # @project_id
        # /fieldapi/checklists/v1?ticket=cfa003c3-220b-11e3-89a6-02cc3afa57bd&project_id=b24337e0-6937-11e1-af3c-1231390b71c2
      end

      def is_item?
        
      end

      def get(id)

        @client.new_get(@path, {:project_id => "4689d194-0a74-11e3-89a6-02cc3afa57bd"})

      end

      def list
        @client.new_get(@path, {:project_id => "4689d194-0a74-11e3-89a6-02cc3afa57bd"})
      end

    end

  end
end
