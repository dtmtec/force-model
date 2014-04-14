module Force
  module Fields
    extend ActiveSupport::Concern
    include ActiveModel::Model

    included do
      class_attribute :fields
      self.fields = {}

      attr_accessor :attributes
    end

    def initialize(attributes={})
      self.attributes = {}

      super(attributes)
    end

    module ClassMethods
      def field(name, options={})
        field = Force::Field.new(name, options)
        fields[name] = field
        create_accessors(field)

        field
      end

      private

      def create_accessors(field)
        define_method field.name do
          raw = self.attributes[field.name]
          field.deserialize(raw)
        end

        define_method "#{field.name}=" do |value|
          self.attributes[field.name] = field.serialize(value)
        end
      end
    end
  end
end
