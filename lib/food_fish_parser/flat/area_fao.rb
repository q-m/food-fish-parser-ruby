module FoodFishParser
  module Flat
    module AreaFao

      REGEX_CODE = / 0?\d{2} (?: (?: -0?\d{2} | (?: \/ | - | \s+ | ) [lIV]+ ) [a-d]? )? /ix
      REGEX = /
        \b FA[O0]
        \s* (?: -? (?:zone|gebied|area) )? \s* (?:nummer|nr\.?|,)?
        \s*
        (
          #{REGEX_CODE}
          (?:
            (?: ,?\s*en\s* #{REGEX_CODE} ) |
            (?: \/ #{REGEX_CODE} )+ |
            (?: (?: ,\s* #{REGEX_CODE} )+ (?: ,?\s*en\s* #{REGEX_CODE} )? )
          )?
        )
        \b
      /ix

      def self.find_all_code_groups(text)
        text
          .scan(REGEX)
          .flatten(1)
          .map {|s| s.split(/\s*(?: en | ,\s*en | , | \/ )\s*/xi) }
          .map {|a| a.map {|s| s.gsub(/\A0(\d{2})\z/, '\1') } } # normalize trailing zeroes
      end

      def self.find_all(text)
        find_all_code_groups(text)
          .map {|a| { text: nil, fao_codes: a } }
      end
    end
  end
end
