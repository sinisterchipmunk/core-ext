class String
  # The inverse of +ActiveSupport::Inflection#humanize+: Lowercases the first letter, and turns spaces into underscores.
  # This is meant to assist in creating method names. A camelCase method name can be created using #dehumanize:
  #   "say_hello_to_the_world".camelize.dehumanize  # => "sayHelloToTheWorld"
  #
  # This can also be used for creating permalinks:
  #   "Say hello to the world".dehumanize           # => "say_hello_to_the_world"
  def dehumanize
    self.camelize.gsub(/^([A-Z])/) { |x| x.downcase }.gsub(/ /, '_')
  end

  def parenthesize(with = "()")
    with[0].chr + self + with[(with.length == 1 ? 0 : 1)].chr
  end

  # This method assumes that this string represents a Ruby-like method name.
  # Removes question marks and exclamation marks from this string, prepending "is_" or "force_", respectively.
  # If neither of these punctuation marks exist, the original string is returned.
  def depunctuate
    if self[/\?/]
      "is_"+self.gsub(/\?/, '')
    elsif self[/\!/]
      "force_"+self.gsub(/\!/, '')
    else self
    end
  end

  unless defined?(indent)
    # Returns a copy of itself, except that the first character is preceded by a tabstop (\t) and a tabstop
    # also follows every subsequent newline (\n) character.
    #
    # The unused argument is for compatibility with treetop, a cucumber dependency.
    def indent(unused = 0)
      "\t#{self.gsub(/\n/m, "\n\t")}"
    end
  end

  def hex_to_bin
    temp = gsub("\s", "");
    ret = []
    (0...temp.length / 2).each { |index| ret[index] = [temp[index*2, 2]].pack("H2") }
    return ret.join
  end
end
