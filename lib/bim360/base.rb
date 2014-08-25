module Bim360

  # A base class for Bim360-Field's model objects
  # automatically generating attribute and predicate methods.
  class Base

    attr_reader :attributes



    class << self

      def attr_reader(*attrs)
        attrs.each do |attr|
          define_attribute_method(attr)
          define_predicate_method(attr)
        end
      end



      private

      def define_attribute_method(method)
        define_method(method) do
          memoize(method) do
            @attributes[method]
          end
        end
      end

      def define_predicate_method(method)
        define_method(:"#{method}?") do
          !!@attributes[method]
        end
      end

    end



    def initialize(attributes = {})
      # kind = attributes[:kind]
      # data = attributes[:data]

      @attributes = attributes
      # @attributes[:kind] = kind
    end

    def [](method)
      send(method.to_sym)
    rescue NoMethodError
      nil
    end

    def keys
      @attributes.keys
    end

    protected

    
    # def resource(*resources)
    #   custom_resource_names = {:sms => 'SMS', :sip => 'SIP'}
    #   resources.each do |r|
    #     resource = twilify r
    #     relative_path = custom_resource_names.fetch(r, resource)
    #     path = "#{@path}/#{relative_path}"
    #     enclosing_module = @submodule == nil ? (Twilio::REST) : (Twilio::REST.const_get(@submodule))
    #     resource_class = enclosing_module.const_get resource
    #     instance_variable_set("@#{r}", resource_class.new(path, @client))
    #   end
    #   self.class.instance_eval {attr_reader *resources}
    # end


    private

    def memoize(key, &block)
      ivar = :"@#{key}"
      return instance_variable_get(ivar) if instance_variable_defined?(ivar)

      result = block.call
      instance_variable_set(ivar, result)
    end

  end
end
