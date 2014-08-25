require 'bim360/base'

module Bim360

  # A base class for objects which have both a kind and an identifier.
  class Thing < Bim360::Base

    attr_reader :id
    attr_reader :kind

    def ==(other)
      return false unless other.is_a?(Thing)
      full_name == other.full_name
    end

    # Returns the object's full name.
    def full_name
      @full_name ||= "#{kind}_#{id}"
    end

    def id
      @id ||= @attributes[self.class.primary_key]
      # @attributes[self.class]
      # self.class.name.split('::')[-1]
      # @attributes[]
    end

  end
end
