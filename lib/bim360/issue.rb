require 'bim360/thing'

module Bim360
  
  class Issue < Bim360::Thing

    attr_reader :document_folder_references,    # Array
                :fields,                        # Array: {:value, :display_type, :name, :id}
                :comments,                      # Array: {:created_at, :text, :created_by, :updated_at, :id}
                :uri_references,                # Array: 
                :created_by,                    # String: email address
                :id                             # String: 36char GUID

    def self.path(id=nil)
      path = "fieldapi/issues/v2"
      path << "/#{id}" unless id.nil?
      path
    end

  end
end

# Comments Output example
# {
#   :created_at=>2014-03-06 08:00:26 -0800, 
#   :text=>"Carpenters asked to ass addl light stands", 
#   :created_by=>"afeliciano@webcor.com", 
#   :updated_at=>2014-08-18 08:47:54 -0700, 
#   :id=>"5BDB5584-0052-4C54-A5EB-086F6058E91D"
# }

#Fields Output example
# [
# {:value=>"2013-12-18", :display_type=>"date", :name=>"Due date", :id=>"f--due_date"}, 
# {:value=>nil, :display_type=>"numeric", :name=>"Bare material cost", :id=>"f--bare_material_cost"}, 
# {:value=>nil, :display_type=>"numeric", :name=>"Bare labor cost", :id=>"f--bare_labor_cost"}, 
# {:value=>"", :display_type=>"text", :name=>"Location detail", :id=>"f--location_detail"}, 
# {:value=>"029d8165-1143-11e3-89a6-02cc3afa57bd", :display_type=>"issue_type_id", :name=>"Issue type", :id=>"f--issue_type_id"}, 
# {:value=>"TH-00013", :display_type=>"text", :name=>"Identifier", :id=>"f--identifier"}, 
# {:value=>"Test from library ", :display_type=>"textarea", :name=>"Description", :id=>"f--description"}, 
# {:value=>nil, :display_type=>"company_id", :name=>"Responsible company", :id=>"f--responsible_company_id"}, 
# {:value=>"Open", :display_type=>"drop-down", :name=>"Status", :id=>"f--status"}, 
# {:value=>nil, :display_type=>"location", :name=>"Location", :id=>"f--location_id"}, 
# {:value=>false, :display_type=>"checkbox", :name=>"Clarification needed", :id=>"f--clarification_needed"}, 
# {:value=>nil, :display_type=>"root_cause_id", :name=>"Root cause", :id=>"f--root_cause_id"}
# ]

# URI reference Output example:
# {
#   :created_at=>2013-12-18 08:52:17 -0800, 
#   :caption=>"google", 
#   :tags=>"",
#   :name=>"google",
#   :created_by=>"email@example.com", 
#   :updated_at=>2013-12-18 08:52:17 -0800, 
#   :path=>"http://google.com", 
#   :id=>"36char GUID"
# }