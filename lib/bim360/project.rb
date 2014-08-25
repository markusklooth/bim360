require 'bim360/thing'
require 'bim360/checklist'

module Bim360
  
  class Project < Bim360::Thing

    attr_reader :brand_color, :is_active, :brand, :issue_filters, :lock_closed_checklists, 
                :default_issue_due_date, :filters, :document_paths, :needs_duns, :is_sub, 
                :lock_closed_tasks, :task_edit_by_assignee_only, :issue_workflow_rule, 
                :is_trial, :permissions, :always_allow_attachments, :user_roles, :name, 
                :project_id, :user_company_id


    # attr_primary_key :project_id
    # primary_key :project_id
    # Get the api path for a project
    #
    # @param project [String BIM360 project_id
    # @return [String] Project Api path
    def self.path(project=nil)
      if project
        "api/project"
      else
        "api/projects"
      end
    end

    def self.primary_key
      :project_id
    end

    def initialize(*args)
      super
    end

    def checklists
      
    end

  end
end
