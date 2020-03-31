module FoodFishParser
  module Flat
    module AquacMethod

      REGEX = /
        (
          kwekerij(?:en)? |
          \bkweekvijvers? |
          \bvijvers?(?:\s*\/\s*bassins?)? |
          \b(?:open\s+)? kooien (?: \s+in\s+zee | \s+in\s+rivier )? |
          \bdoorstroomsystemen |
          \b(?:open\s+)? hangcultuur |
          \bgekweekt\s+in\s+netten
        )
        \b
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
