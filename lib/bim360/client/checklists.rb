require "bim360/checklist"

module Bim360
  class Client

    # Methods for the Checklists API

    module Checklists

      # Get all checklists for a specific project
      # 
      # @param options [Hash] 
      def all_checklists(options = {})
        # /fieldapi/checklists/v1?project_id=b24337e0-6937-11e1-af3c-1231390b71c2

        options[:project_id] = options.fetch(:project_id, @project_id)
        resp = get Checklist.path, options
        objects_from_response(resp, Bim360::Checklist)

      end


      # Get a single checklist
      #
      # @param checklist [GUID] BIM360-Field project_id.
      # @return [Sawyer::Resource]
      # @example
      #   Bim360.checklist("4689d194-0a74-11e3-89a6-02cc3afa57bd") OR
      #   Bim360.checklist(checklist_id: <CHECKLIST_ID>, project_id: <PROJECT_ID>)
      def checklist(checklist_id, options = {})
        if checklist_id.is_a?(Hash) then
          options       = checklist_id
          checklist_id  = options.delete(:checklist_id)
        end

        options[:project_id] = options.fetch(:project_id, @project_id)

        resp = get Checklist.path(checklist_id), options
        objects_from_response(resp, Bim360::Checklist)
      end

      def create_checklist(options = {})

        options[:project_id] = options.fetch(:project_id, @project_id)

        resp = post Checklist.path, options
      end

      def delete_checklist(checklist_id, options= {})
        options[:project_id] = options.fetch(:project_id, @project_id)
        resp = delete Checklist.path(checklist_id), options

      end

      def update_checklist(checklist_id, options = {})
        options[:project_id] = options.fetch(:project_id, @project_id)
        resp = put Checklist.path(checklist_id), options
      end

    end

  end
end