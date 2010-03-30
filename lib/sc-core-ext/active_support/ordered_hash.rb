unless ActiveSupport::OrderedHash.methods.include?("yaml_initialize")
  class ActiveSupport::OrderedHash
    def yaml_initialize(type, val)
      replace(val)
    end
  end
end
