# encoding: utf-8
require 'minitest/autorun'
require_relative '../lib/regexp_m17n'

class RegexpTest < MiniTest::Unit::TestCase
  def test_non_empty_string
    Encoding.list.each do |enc|
      # Skip encodings that Ruby has no converter for UTF-8
      next if %w[ISO-2022-JP ISO-2022-JP-2 CP50220 CP50221 ISO-2022-JP-KDDI UTF-7].include?(enc.name)
      assert(RegexpM17N.non_empty?('.'.encode(enc)))
    end
  end
end
