module RegexpM17N
  def self.non_empty?(str)
    if !str.encoding.dummy?
      # Try to preserve original string and make regexp in corresponding encoding
      str =~ Regexp.new('^.+$'.encode(str.encoding))
    else
      # We can't make Regexp out of dummy encoding so try matching in UTF-8 instead
      str.encode('UTF-8') =~ Regexp.new('^.+$'.encode('UTF-8'), Regexp::FIXEDENCODING)
    end
  end
end