require "bim360/base"
module Bim360

  class Section < Bim360::Base

    def self.setup(sections)

        section = new({is_root: true, items: sections})

    end


    # Group:
    # :section_name
    # :items

    # Items: Array of items inside :items
    # :position
    # :display_number
    # :is_conforming      "N/A"
    # :created_at
    # :attachments
    # :display_type       "drop-down", 
    # :issues
    # :comment
    # :possible_values    ["Pass", "Fail", "N/A"]
    # :response
    # :question_text
    # :created_by
    # :updated_at
    # :id
    # :spec_ref
    attr_reader :parent, :_items

    def initialize(options={}, parent=nil)
      super(options)
      @is_root = true if options[:is_root]
      @parent  = parent unless parent.nil?

      setup_items(options[:items]) if options[:items]
    end

    def setup_items(items)
      klass       = self.class
      @is_section = true unless @is_root

      @_items     = []
      items.each do |item|
        @_items << klass.new(item, self)
      end
    end

    def is_root?
      !!@is_root
    end

    def is_item?
      !!@is_item
    end

    def is_section?
      !!@is_section
    end

  end

end
