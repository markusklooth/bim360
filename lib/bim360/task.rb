require 'bim360/thing'

module Bim360
  class Task < Bim360::Thing

    # attr_reader :status,          # String: "Open"


    def self.path(task_id=nil)
      path =  "/fieldapi/tasks/v1"
      path << "/#{task_id}" unless task_id.nil?
      path
    end


    
    
  end
end
