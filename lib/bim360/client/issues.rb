# require "bim360/project"
require "bim360/issue"

module Bim360
  class Client

    # Methods for the Issues API

    module Issues

      def all_issues(options = {})
        project_id = options.fetch(:project_id, @project_id)
        opts = {query: options}
        opts[:query][:project_id] = project_id
        opts
        # resp = get Issue.path, opts
        # objects_from_response(resp, Bim360::Project)

      end




      protected 


    end

  end
end