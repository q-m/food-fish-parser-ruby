module FoodFishParser
  module Flat
    module CatchMethod

      REGEX = /
        \b
        (
          (?:
            trawlnet(?:ten)? |
            (?:pelagische\s+)? trawler (?:\s*,?\s*pelagisch)? |
            pelagische\s+visserij |
            haken\s+en\s+lijnen |
            (?:machinale\s+)? handlijnen |
            (?:ring-|ringnet|ringetten)\s+en\s+kruisnet(?:ten)? |
            ringnet(?:ten)? |
            kruisnet(?:ten)? |
            sleeplijn(?:en)? |
            sleepnet(?:en)? |
            kieuwnet(?:ten)? |
            lijn-?gevangen |
            (?:soortgelijke|vergelijkbare)\s+net(?:ten)? |
            (?:zwevende\s+)? (?:bodem)?(?:otter)?trawls? |
            (?:deense\s+)? zegens? |
            ringzegens? |
            hengels?\s+en\s+lijn(?:en)? |
            met\s+de\s+hengel |
            met\s+lijnen |
            korven\s+en\+vallen |
            vallen |
            dreggen |
            purse\s*seiner
          )
          (?:\s+en\s+soortgelijke\s+netten)?
        )
        (?:visserij)?
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
