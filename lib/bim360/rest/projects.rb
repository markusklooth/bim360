module Bim360
  module REST

    class Projects

      # :brand_color, :is_active, :brand, :issue_filters, :lock_closed_checklists, 
      # :default_issue_due_date, :filters, :document_paths, :needs_duns, :is_sub, 
      # :lock_closed_tasks, :task_edit_by_assignee_only, :issue_workflow_rule, 
      # :is_trial, :permissions, :always_allow_attachments, :user_roles, :name, 
      # :project_id, :user_company_id


      def initialize(client, params={})
        @client = client
        @path = "projects"
      end

      def get()

      end

      def list()
        response = @client.get @path, params, full_path

      end

    end

  end
end
