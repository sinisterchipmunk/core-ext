class Hash
  # Performs a "deep copy" of this hash; that is, returns a Hash that is a duplicate of this Hash, and whose
  # keys and values have each, in turn, had #deep_dup or #dup called on them. This should produce a Hash whose every
  # element is a copy of the original.
  #
  # This operation is expensive, and should be used sparingly.
  def deep_dup
    inject(self.class.new) do |new_hash, (key, value)|
      key = key.respond_to?(:deep_dup) ? key.deep_dup : key.dup?
      value = value.respond_to?(:deep_dup) ? value.deep_dup : value.dup?
      new_hash[key] = value
      new_hash
    end
  end

  def without(*keys)
    keys.flatten!
    inject(self.class.new) do |hash, (key, value)|
      hash[key] = value unless keys.include?(key)
      hash
    end
  end

  def without_values(*values)
    values.flatten!
    inject(self.class.new) do |hash, (key, value)|
      hash[key] = value unless values.include?(value)
      hash
    end
  end

  # Returns a hash that is a copy of this one, except that all nil values have been removed, making them
  # essentially "optional" keys.
  def optionalize
    without_values(nil)
  end

  alias without_nil_values optionalize

  def camelize_keys
    stringified = stringify_keys
    stringified.rename(stringified.inject(self.class.new) do |renamed, (key, value)|
      renamed[key] = key.camelize
      renamed
    end)
  end

  # Takes a hash whose keys must match keys in this hash. Those keys will be renamed to match the
  # corresponding value in the specified hash.
  #
  # Keys not found are ignored.
  #
  # Returns self.
  #
  # Example:
  #   { :a => 1 }.rename(:a => :b)
  #     => {:b => 1}
  #
  def rename(to)
    merge!(inject(self.class.new) do |hash, (old_key, value)|
      hash[to[old_key] || old_key] = value
      delete(old_key)
      hash
    end)
  end
end
