module Bim360
  module REST

    class Checklists

      # :status           "Open"
      # :created_at
      # :checklist_type   "QA/QC"
      # :name             "QC - Grace Subgrade Waterproofing"
      # :updated_at     
      # :id               "c0e7651b-1699-11e3-89a6-02cc3afa57bd"
      # :identifier       "0001"

      # Additional properties when a single checklist is loaded
      # :signatures
      # :custom_field_values
      # :source
      # :company
      # :comments
      # :attachments
      # :template       {:name=>"General Unit Interior Punch", :id=>"f90f68c8-5dcb-11e3-8afd-02cc3afa57bd"} 
      # :description
      # :sections
      # :project_id
      # :priority


      def initialize(client, params={})
        @client   = client
        @path     = "checklists"
        # @project_id
        # /fieldapi/checklists/v1?ticket=cfa003c3-220b-11e3-89a6-02cc3afa57bd&project_id=b24337e0-6937-11e1-af3c-1231390b71c2
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
