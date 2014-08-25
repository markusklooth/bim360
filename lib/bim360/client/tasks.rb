require "bim360/task"

module Bim360
  class Client

    # Methods for the Tasks API

    module Tasks

      # Get all checklists for a specific project
      # 
      # @param options [Hash] 
      def all_tasks(options = {})
        # /fieldapi/task/v1?project_id=b24337e0-6937-11e1-af3c-1231390b71c2

        options[:project_id] = options.fetch(:project_id, @project_id)
        resp = get Task.path, options
        objects_from_response(resp, Bim360::Task)

      end


      # Get a single task
      #
      # @param task [GUID] BIM360-Field project_id.
      # @return [Sawyer::Resource]
      # @example
      #   Bim360.task("4689d194-0a74-11e3-89a6-02cc3afa57bd") OR
      #   Bim360.task(task_id: <task_id>, project_id: <PROJECT_ID>)
      def task(task_id, options = {})
        if task_id.is_a?(Hash) then
          options       = task_id
          task_id  = options.delete(:task_id)
        end

        options[:project_id] = options.fetch(:project_id, @project_id)

        resp = get Task.path(task_id), options
        objects_from_response(resp, Bim360::Task)
      end

      def create_task(options = {})

        options[:project_id] = options.fetch(:project_id, @project_id)

        resp = post Task.path, options
      end

      def delete_task(task_id, options= {})
        options[:project_id] = options.fetch(:project_id, @project_id)
        resp = delete Task.path(task_id), options

      end

      def update_task(task_id, options = {})
        options[:project_id] = options.fetch(:project_id, @project_id)
        resp = put Checklist.path(task_id), options
      end

    end

  end
end