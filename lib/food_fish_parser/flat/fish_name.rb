require_relative 'fish_name_latin'
require_relative 'fish_name_nl'

module FoodFishParser
  module Flat
    module FishName
      REGEX_ALLERGEN_NAMES = /\b(?:vis|visvlees|weekdieren)\b/i
      REGEX_ALLERGEN = /\s*(?: \(\s*#{REGEX_ALLERGEN_NAMES}\s*\) | \b,?\s*#{REGEX_ALLERGEN_NAMES}\s*,?\s*\b )/ix

      REGEX = /
        (?:
          (?!#{REGEX_ALLERGEN}) #{FishNameNL::REGEX} (?: #{REGEX_ALLERGEN} )? \s* \( \s* #{FishNameLatin::REGEX} \s* \) |
          (?!#{REGEX_ALLERGEN}) #{FishNameNL::REGEX} \s*,?\s* \b #{FishNameLatin::REGEX} |
          #{FishNameLatin::REGEX} |
          (?!#{REGEX_ALLERGEN}) #{FishNameNL::REGEX}
        )
      /ix

      def self.find_all(text)
        # Because scan doesn't support named captures, we have to use numbered capture groups.
        # Make sure to keep all groups you don't want to reference below as non-capturing groups.
        # Each name regex has a capture group (so as to avoid noise), so you don't see them here.
        # The order of the captures corresponds to the order of the fish names in the regex above.
        text.scan(REGEX).map do |m|
          case
          when m[0] && m[1] then { common: m[0], latin: m[1] }
          when m[2] && m[3] then { common: m[2], latin: m[3] }
          when m[4]         then { common: nil,  latin: m[4] }
          when m[5]         then { common: m[5], latin: nil  }
          end
        end.compact
      end
    end
  end
end
