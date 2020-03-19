require_relative 'fish_name_nl'

module FoodFishParser
  module Flat
    module Kind

      REGEX_WILD = /
        \b
        (?:
          gevangen |
          visgebied |
          vangstgebied |
          vangsgebied |
          betrapt \s+ bij |
          wilde? \s+ #{FishNameNL::REGEX}
        )
        \b
      /ix

      REGEX_AQUAC = /
        \b
        (?:
          gekweekt |
          aquacultuurproduct |
          aquacultuur \s+ product |
          kweekmethode |
          kweekmethoden
        )
        \b
      /ix

      def self.is_wild?(text)
        !!REGEX_WILD.match(text)
      end

      def self.is_aquac?(text)
        !!REGEX_AQUAC.match(text)
      end
    end
  end
end
