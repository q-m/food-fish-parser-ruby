module FoodFishParser
  module Flat
    module AreaName

      REGEX_AREA_NAMES = /
        \b
        (?:
          Cornwall |
          Noorwegen |
          India |
          Ierland |
          Vi[eë]tnam |
          Indonesi[eë] |
          Griekenland |
          Ecuador |
          Limfjord |
          Denemarken |
          Chili |
          Faroër eilanden |
          Groenland |
          Californi[eë] |
          Malediven |
          Spitsbergen |
          Bereneiland |
          Maleisi[eë] |
          (?:
            atlantische | atlantic | pacifische | pacific | stille | noorse |
            middelandse | indische
          ) \s+ (?: oceaan | ocean | zee) |
          Noordzee |
          Barentszzee |
          Ijsland
        )
        \b
      /ix

      REGEX_AREA = /
        \b
        (
          (?: (?: rond | bij | aan | voor ) \s+ )?
          (?: de\s+ (?: kust | fjorden ) \s+van\s+ )?
          (?: (?:\(sub\))?tropische\s+wateren\s+in\s+ )?
          (?: (?: de | het ) \s+ )?
          (?: (?: \s* (?:noord|zuid|oost|west|n|z|o|w)-? )+(?:elijke?)? (?: \s+(?: deel | gedeelte ) (?:\s+van)? )? \s+ )?
          (?: (?: de | het ) \s+ )?
          #{REGEX_AREA_NAMES}
        )
        \b
      /ix

      REGEX = /
        \b#{REGEX_AREA} (?: (?: \s+(?:en|of|en\/of)\s+ | \s*,\s* ) #{REGEX_AREA} )* \b
      /ix

      def self.find_all(text)
        text
          .scan(REGEX)
          .flatten
          .compact
          .map {|s| { text: s.strip, fao_codes: [] } }
      end
    end
  end
end
