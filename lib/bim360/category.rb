require 'bim360/thing'

module Bim360
  
  class Category < Bim360::Thing

    attr_reader :position,                  # Integer:
                :created_at,                # Date
                :category_id,               # String: 36char GUID
                :name,                      # String: Name of category
                :updated_at,                # Date
      
                :vela_defined,              # Boolean: Only defined in main categories
                :category_type,             # String: Only defined in main categories: 
                                            #`RootCause`, `TaskType`, `IssueType`, `EquipmentStatus`, `EquipmentType`

                :customizable_category_id   # Only defined in `customizable_categories`

    def initialize(*args)
      super
    end

  end
end

# Quality: Type: RootCause
# Safety Incident: Type: RootCause
# Safety: Type: RootCause
# Task: Type: TaskType
# Uncategorized: Type: RootCause
# none: Type: EquipmentStatus
# Punch List: Type: IssueType
# Work List: Type: IssueType
# QA/QC: Type: IssueType
# Safety: Type: IssueType
# Commissioning: Type: IssueType
# Other: Type: EquipmentType