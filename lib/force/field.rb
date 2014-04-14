module Force
  class Field
    attr_accessor :name, :type, :options

    def initialize(name, options)
      self.name = name
      self.type = options.delete(:type) || :string

      self.options = options
    end

    def serialize(value)
      case type
      when :time
        value.utc.iso8601 if value
      else
        value.to_s if value
      end
    end

    def deserialize(value)
      case type
      when :time
        Time.parse(value) if value
      when :date
        value.to_date if value
      else
        value.to_s
      end
    end
  end
end
