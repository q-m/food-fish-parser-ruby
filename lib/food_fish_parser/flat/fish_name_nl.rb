# autogenerated by species-treetop-gen-nl.rb on 2020-03-19
module FoodFishParser
  module Flat
    module FishNameNL
      REGEX_AREA = /pacifische|noorse|indische|groenlandse|atlantische|argentijnse|alaska/i
      REGEX_ATTR = /zwarte|zwart|witte|witpoot|wit|roze|rood|rode|rivier|pijl|kleine|klein|grote|groot|groene|groen|doorn|coho|chum|blauwe|blauw/i
      REGEX_NAME = /zonnevis|zeewolf|zeesnoek|zeekreeft|zeeforel|zeebaars|zalm|wijting|weekdieren|weekdier|vintonijn|tonijn\ albacore|tonijn|tong|tilapia|thon\ albacore|tarbot|tapijtschelp|sprot|spie|snotolf|snoekbaars|snoek|skipjack\ tonijn|schol|schelvis|schelpen|schelp|schar|sardines|regenboogforel|raat|poon|pollock|pollak|pangasius|paling|oogtonijn|mul|mosselen|mossel|meerval|mantelschelp|makreel|lom|leng|kreeft|koolvis|kokkel|karper|kabeljauw|hondstong|hoki|heilbot|heek|hake|haai|ha|gruis|griet|geep|geelvintonijn|garnalen|garnaal|fint|coquilles|cocquilles|botervis|bot|beekridder|barracuda|baars|arkschelp|ansjovis|albacore\ tonijn/i
      REGEX_SUFX = /vlees|ringen|ring|filets|filet/i

      REGEX = /
        (?: \b verse \s+ )?
        \b
        (
          (?: #{REGEX_AREA} \s+ )? (?: #{REGEX_ATTR} \s* )? #{REGEX_NAME} (?: #{REGEX_SUFX} )?
        )
        \b
      /ix
    end
  end
end
