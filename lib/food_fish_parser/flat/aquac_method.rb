module FoodFishParser
  module Flat
    module AquacMethod

      REGEX = /
        (
          kweekvijvers? |
          vijvers?\s*\/\s*bassins? |
          (?:open\s+)? kooien (?: in\s+zee | in\s+rivier )? |
          doorstroomsystemen |
          (?:open\s+)? hangcultuur |
          gekweekt\s+in\s+netten
        )
      /ix

      def self.find_all(text)
        text
          .scan(REGEX)
          .flatten
          .map {|s| { text: s } }
      end
    end
  end
end
