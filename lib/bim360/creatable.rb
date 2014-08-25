require 'time'

module Bim360

  # Methods which return the time of creation for objects.
  module Creatable

    # The time when the object was created on reddit.
    #
    # @return [Time]
    def created_at
      created = @attributes[:created_at]
      @created_at ||= Time.at(created) if created
    end

    def updated_at
      updated = @attributes[:created_at]
      @updated_at ||= Time.at(updated) if updated
    end

  end
end
