require 'bim360/thing'
# require 'bim360/checklist'

module Bim360
  
  class Company < Bim360::Thing
     # :ctype=>""
     # :company_id=>"5848be2c-035b-11e3-89a6-02cc3afa57bd"
     # :name=>"Webcor Builders"
     # :updated_at=>2013-12-17 16:53:10 -0800
     # :category=>"Contractor"

    attr_reader :ctype,             # String: Trade type: "Other", "Concrete", "Mechanical"
                :company_id,        # String: 36char GUID: 3c40f3af-5ea4-11e3-8afd-02cc3afa57bd
                :name,              # String: Name of company: e.g. Webcor Builders
                :updated_at,        # String: Timestamp 2013-12-06 10:28:43 -0800
                :category           # String: Contractor, Subcontractor, Commissioning Agent, Owner, Architect, Engineer, Consultant


    def self.primary_key
      :company_id
    end

    def initialize(*args)
      super
    end

    def checklists
      
    end

  end
end
