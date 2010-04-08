class Array
  # Performs a "deep copy" of this array; that is, returns an Array that is a duplicate of this Array, and whose
  # elements have each, in turn, had #deep_dup or #dup called on them. This should produce an Array whose every
  # element is a copy of the original.
  #
  # This operation is expensive, and should be used sparingly.
  def deep_dup
    self.collect do |ele|
      ele.respond_to?(:deep_dup) ? ele.deep_dup : ele.dup?
    end
  end

  # Modulus operator: returns an array consisting only of those elements that are shared by both this array and
  # the arr object. If arr is not an array, then only elements equal to arr itself are returned.
  #
  # Examples:
  #   [1, 2, 3] % [1, 2]   # => [1, 2]
  #   [1, 2, 3] % 2        # => [2]
  #
  def %(arr)
    select { |i| arr.kind_of?(Array) ? arr.include?(i) : arr == i }
  end
end
