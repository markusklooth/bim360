require 'bim360/thing'
# require 'bim360/checklist'

# :company_id: e0e95082-1189-11e3-89a6-02cc3afa57bd
# :user_id:    0c35bbbf-93ff-11e3-b906-02cc3afa57bd

module Bim360
  
  class Contact < Bim360::Thing

    attr_reader :roles,        # "document_manager,photo_viewer,contractor" 
                :telephone,    
                :first_name,   # String: e.g. Max
                :last_name,    # String: e.g. Mustermann
                :user_id,      # 36 char GUID
                :company_id,   # 36 char GUID
                :email,
                :junior,
                :id, 
                :key_contact


    def initialize(*args)
      super
    end

    def roles
      @roles.split(",")
    end

  end
end
