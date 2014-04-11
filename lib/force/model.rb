require "force/model/version"
require "active_support/concern"
require "active_support/core_ext"
require "active_model"

module Force
  module Model
    extend ActiveSupport::Concern
    include ActiveModel::Model

    included do
      class_attribute :fields
      self.fields = []

      attr_accessor :attributes
    end

    def initialize(attributes={})
      self.attributes = {}

      super(attributes)
    end

    module ClassMethods
      def field(name, options={})
        self.fields << { name: name }.merge(options)

        case options[:type].to_s
        when 'Time'
          define_method name do
            Time.parse(self.attributes[name])
          end
        when 'Date'
          define_method name do
            Date.parse(self.attributes[name])
          end
        else
          define_method name do
            self.attributes[name]
          end
        end

        define_method "#{name}=" do |value|
          self.attributes[name] = value
        end
      end
    end
  end
end
