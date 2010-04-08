class Object
  # Attempts to call #dup, and returns itself if the object cannot be duped (Symbol, Fixnum, etc.)
  def dup?
    dup rescue self
  end

  class << self
    # Creates an attribute accessor similar to attr_accessor, except the reader is appended with a question mark.
    # The variable name is the same.
    #
    # Example:
    #   attr_boolean :new_record   # => { #new_record=(bool), #new_record? }
    #
    def attr_boolean(*a)
      attr_writer *a
      a.each { |i| define_method("#{i}?") { instance_variable_get("@#{i}") } }
    end
  end
end
