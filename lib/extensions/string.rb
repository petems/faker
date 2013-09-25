# encoding: utf-8

class String
  CJKV_RANGES = [
      (0xe2ba80..0xe2bbbf),
      (0xe2bfb0..0xe2bfbf),
      (0xe38080..0xe380bf),
      (0xe38180..0xe383bf),
      (0xe38480..0xe386bf),
      (0xe38780..0xe387bf),
      (0xe38880..0xe38bbf),
      (0xe38c80..0xe38fbf),
      (0xe39080..0xe4b6bf),
      (0xe4b780..0xe4b7bf),
      (0xe4b880..0xe9bfbf),
      (0xea8080..0xea98bf),
      (0xeaa080..0xeaaebf),
      (0xeaaf80..0xefbfbf),
  ]

  def contains_asian_characters?
    each_char do |ch|
      return true if CJKV_RANGES.any? {|range| range.member? ch.unpack('H*').first.hex }
    end
    false
  end
end
