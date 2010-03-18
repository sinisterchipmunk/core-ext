class Regexp
  # Searches the target for all occurrances of this Regex. If a block is given, yields each match found.
  # Returns an array of all matches found.
  def each_match(target)
    matches = []
    offset = 0
    while offset < target.length && !(match = match(target[offset..-1])).nil?
      offset += match.offset(0)[1]
      yield match if block_given?
      matches << match
    end
    matches
  end
end
