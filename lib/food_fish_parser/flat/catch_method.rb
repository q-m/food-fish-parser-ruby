module FoodFishParser
  module Flat
    module CatchMethod

      REGEX = /
        \b
        (
          trawlnet(?:ten)? |
          trawler |
          haken\s+en\s+lijnen |
          (machinale\s+)? handlijnen |
          ring-\s+en\s+kruisnet(?:ten)? |
          ringnet(?:ten)? |
          kruisnet(?:ten)? |
          sleeplijn(?:en)? |
          kieuwnet(?:ten)? |
          (?:soortgelijke|vergelijkbare)\s+net(?:ten)? |
          (?:zwevende\s+)? (?:bodem)?(?:otter)?trawls? |
          (?:deense\s+)? zegens? |
          ringzegens? |
          hengels?\s+en\s+lijn(?:en)? |
          met\s+de\s+hengel |
          met\s+lijnen |
          vallen |
          purse\s*seiner
        ) (?:visserij)?
        \b
      /ix

      def self.find_all(text)
        text
          .scan(REGEX)
          .flatten
          .compact
          .map do |s|
            s.gsub!(/^met\b(\s+de\b)?\s*/, '')
            { text: s }
          end
      end
    end
  end
end
