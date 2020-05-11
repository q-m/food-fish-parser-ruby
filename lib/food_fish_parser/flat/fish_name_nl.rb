# autogenerated by species-treetop-gen-nl.rb on 2020-05-11
module FoodFishParser
  module Flat
    module FishNameNL
      REGEX_AREA = /zeeuwse|turkse|tropische|spaanse|portugese|peruaanse|patagonische|pacifische|pacific|noorse|noordse|nieuwzeelandse|mediterrane|marokkaanse|kaapse|japanse|indische|ijsselmeer|hollandse|guinee|groenlandse|franse|filipijnse|europese|engelse|chinese|chileense|aziatische|atlantische|argentijnse|antarctische|amerikaanse|alaska|afrikaanse/i
      REGEX_ATTR = /zwarte|zwart|zilveren|zilver|witte|witpoot|wit|spiegel|ruwe|roze|rood|rode|rivier|reuze|red|platte|plat|pijl|oog|kleine|klein|grote|groot|groene|groen|grise|grijze|grijs|gouden|goud|gewone|gevlekte|gestreepte|gestekelde|doorn|diepzee|coho|chum|chum|chinook|bonte|blonde|blond|blauwe|blauw/i
      REGEX_NAME = /zwemkrab|zwaardvis|zwaardschede|zuid\ afrikaanse\ gestreepte\ zeebrasem|zonnevis|zoetwaterreuzegarnaal|zoetlip|zeskieuwhaai|zeilvis|zeewolf|zeetong|zeesnoek|zeeschijter|zeerat|zeeraaf|zeeprik|zeepaling|zeeoor|zeemeerval|zeelt|zeekreeft|zeekat|zeekarper|zeeforel|zeeduivel|zeedonderpad|zeebrasem|zeebarbeel|zeebaars|zee\-engel|zee\-egel|zebrabrasem|zandvis|zandtong|zandbaars|zalmforel|zalm|zakpijp|zadelzeebrasem|zaagje|yellowtail\ kingfish|wulk|wrattige\ venusschelp|wrattige\ krab|wrakbaars|wolhandkrab|wolfharing|winde|wijting|wijde\ mantel|west\ afrikaanse\ rode\ mul|weekdieren|weekdier|walapa|wahoo|voshaai|vorkpompano|vongole|vliegende\ vis|vleet|vlagzalm|vis|vioolrog|vintonijn|vin\ tonijn|vin\ rifhaai|victoriabaars|vermillioen\ snapper|venusschelp|valse\ snapper|trekkervis|tonkin\ ombervis|tonijn\ skipjack|tonijn\ albacore|tonijn|tongschar|tong|toekoenari|tilapia|tijgergarnaal|thon\ albacore|tegelvis|tarpoen|tarbot|tapijtschelp|tandbrasem|tandbaars|tafelmesheft|streep\ sardine|strandschelp|strandkrab|strandgaper|stompneus|stoleforus\ ansjovis|stokvis|stevige\ strandschelp|steurgarnaal|steur|sterrekijker|sterlet|ster|stekelrog|stekelaal|steenwijting|steenhaai|steenbolk|staartvis|st\.\ pierre|st\.\ jacobsschelp|sprot|springkrab|spitssnuitzeebrasem|spiering|sockeye\ zalm|snotolf|snotdolf|snoekbaars|snoek|sneep|snapper|smelt|sliptong|slibgarnalen|slibgarnaal|sleutelgathoorn|slatdick|slangmakreel|skrei|skipjack\ tuna|skipjack\ tonijn|skipjack|sint\-pietervis|sint\-jacobsschelp|sint\ jacobsschelp|sillago|signaalkreeft|serpeling|senegalese\ tong|seabob\ garnalen|seabob\ garnaal|schurftvis|schotzalm|schoteloog\ zeebrasem|schorpioenvis|schol|scherpsnuitrog|schelvis|schelpen|schelp|scharretong|schar|schaalhoorn|scampi|sardinops|sardines|sardinen|sardinelle|sardine|sardienen|sardien|salmon|saibling|russels\ horsmakreel|rouget|rotskabeljauw|ross\-dwerginktvis|roofblei|roodbaars|ronde\ haring|rogvleugel|rog|rivierkreeft|rietvoorn|riddervis|regenboogforel|raat|punthaai|puitaal|puffervis|prik|pos|poon|poolkabeljauw|ponyvis|pompano|pomfret|pollock|pollak|plooibekken|platte\ oester|pladijs|pireng|pilchard|pijlinktvis|pieterman|pelser|peled\ marene|pataka|patagonische\ ijsvis|papegaaivis|pantsermeerval|pantsergarnaal|pangasius\ meerval|pangasius|panga\ zeebrasem|panga|pandora|paling|pakoesi|pagre|ovale\ strandschelp|oregon\ garnaal|oostzeehouting|oostzeegarnaal|oostelijke\ nawaga|oogtonijn|oogtandbrasem|oogbrasem|oog\ tonijn|oog\ ombervis|oog|omegabaars|ombervis|olympia\ oester|olievis|oktopus|oester|octopus|nzeebaars|nylongarnaal|notialis\ garnaal|noordzeekrab|noordzeegarnaal|noordkromp|noordhoorn|noordelijke\ kamschelp|noordelijke\ grenadiervis|nonnetje|nijlbaars|nieuw\ zeelandse\ tarbot|nieuw\ zeelandse\ paling|nhaai|ngarnaal|neustong|neushaai|neus|negenoog|namaga\ kabeljauw|murene|mul|mosselen|mossel|middellandsezeemossel|meun|messchede|mesheft|merluza|menhaden|melkvis|meerval|masu\ zalm|marlijn|marene|mantelschelp|mantel|makreelhaai|makreelgeep|makreel|mahi\-mahi|mahi\ mahi|maatjesharing|maanvis|maanstaart\ zeebaars|lom|lodde|lipvis|lethrinus|lepel|leng|lekkerbekje|leervis|langvin\ mako|langstaart\ tonijn|langstaart\ heek|langoustine|langoest|lange\ schar|lactariusvis|kwie\ kwie|kwabaal|kustbaardman|kuruma\ garnaal|kumupoon|kroeskarper|krobia|krill|kreukel|kreeft|krab|koraalbaars|kopzeebrasem|kopvoorn|kopkarper|koornaarvis|koolvis|koningsvis|koningsmakreel|koningskrab|koningsklip|koningsgarnaal|konings\ ombervis|konijnvis|kolblei|kokkel|kokhaan|kogelvis|kogeltonijn|knorvis|klimbaars|kleurige\ venusschelp|kinkhoorn|king\ clip|kilka|keta\ zalm|keizersbaars|keizerbaars|keilrog|keeltje|kathaai|karper|kamtschatka\ krab|kabeljauw|john\ dory|je|inktvis|ijsvis|ijsheek|houting|horsmakreel|hondstong|hondshaai|hoki|hirame|heilbot|heekrug|heek|hartschelp|haringhaai|haring|harder\ diklip|harder|hamvis|hamerhaai|hake|haarstaartvis|haarstaartdegenvis|haanvis|haai\ alias\ reuzenhaai|haai|gruis|grouper|grote\ mantelschelp|grondel|griet|grenadier|grauwe\ poon|gratenvis|graskarper|glycymeris|gladde\ haai|giebel|gevlekte\ zeekomkommer|gevlekte\ garnaal|gestreepte\ zeebrasem|geribde\ hartschelp|geep|geelvintonijn|geelvinmakreel|geelvin\ tonijn|geelstaart\ koningsvis|geelstaart|geelgestreepte\ horsmakreel|gedoornde\ hartschelp|garnalen|garnaal|gamba|galatheakreeft|gaffelkabeljauw|fuscabaardman|fregatmakreel|forellenbaars|forel|fint|escolar|elrits|elft|dwergmeerval|dwerginktvis|dwergbolk|duorarum\ garnaal|dunlipharder|duivelsrog|dubbelgestippelde\ alver|drijfvis|draadvinnige\ haring|draadvinnige\ elft|dorade\ royale|dorade|donaubrasem|donau\ zalm|donau|dolfijnvis|doktersvis|diklipharder|diklip\ harder|dikke\ platschelp|diepzeegarnaal|degenvis|daurade|datra\ fisi|dageraad|corvina|coquilles|coquille|congeraal|conger\ aal|cocquilles|cobia|claresse\ meerval|claresse|caviaar|caramote\ garnaal|canadese\ zeekreeft|californische\ rivierkreeft|bultige\ tandbrasem|buikgarnaal|bruine\ zeekomkommer|bruine\ venusschelp|brotula|bronforel|brasemblei|brasem|braam|braadharing|botervis|botermakreel|bot|bonito|boniter|bokvis|blood\ snapper|blankvoorn|beryx|beluga|bek|beerkreeft|beekridder|beekforel|bastaardknorvis|bastaardgeep|barramundi|barracumundi|barracuda|barbeel|barbaman|bandmul|bandeng|bacalao|baars|baardman|australische\ zalm|australische\ wijting|australische\ paling|arkschelp|argentijnse\ garnaal|ansovis|ansjovis|anjoemara|alver|alikruik|alfonsino|albacore\ tonijn|albacore|alaskakoolvis|afgeknotte\ strandschelp|afgeknotte\ gaper|adriatische|adelaarsvis|adalah|acoupa\ ombervis|achtarmige\ inktvis|aal/i
      REGEX_SUFX = /wang|vlees|steur|ringen|moten|lever|kaviaar|filets|filetes|filet|eiwit/i

      REGEX = /
        (?: \b verse \s+ | \b kaviaar \s+ | \b kaviaar \s+ van \s+ | \b gevilde \s+ )?
        \b
        (
          (?: #{REGEX_AREA} \s+ )? (?: #{REGEX_ATTR} \s* )? #{REGEX_NAME} (?: #{REGEX_SUFX} )?
        )
        \b
      /ix
    end
  end
end
