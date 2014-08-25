require 'bim360/thing'
require 'bim360/section'
module Bim360
  class Checklist < Bim360::Thing

    attr_reader :status,          # String: "Open"
                :created_at,      # String: Timestamp
                :checklist_type,  # String: "QA/QC"
                :name,            # String: e.g. "QC - Grace Subgrade Waterproofing"
                :updated_at,      # String: Timestamp
                :id,              # String: 36char GUID
                :identifier,      # String: "0001"

                # Full resource only: 
                :custom_field_values, # Array:
                :sections,        # Array: includes sections and items with answers
                :source,          # Hash:
                :company,         # Hash: e.g. {:name, :id}
                :comments,        # Array:
                :attachments,     # Array:
                :signatures,      # Array: 
                :template,        # Hash: {:name, :id} 
                :description,     # String: text
                :project_id,      # String: 36char GUID
                :priority         # String: e.g. "High"

    attr_reader :list

    def self.path(checklist_id=nil)
      path =  "/fieldapi/checklists/v1"
      path << "/#{checklist_id}" unless checklist_id.nil?
      path
    end

    def initialize(*args)
      super(*args)
      setup_sections
    end

    def setup_sections
      @list = Section.setup(@sections)
      # Section.new
    end

    
    
  end
end
