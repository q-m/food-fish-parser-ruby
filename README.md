# Food fish parser

[![Gem Version](https://badge.fury.io/rb/food_fish_parser.svg)](https://rubygems.org/gems/food_fish_parser)

Food products with fish in them often list some details about the particular species,
fishing method and origin. This [Ruby](https://www.ruby-lang.org/) gem and program parses
the text found on the product and returns a structured representation.

At this moment, the parser mostly recognises Dutch-language text.

Please note that this code is in an early stage of development.

## Installation

```
gem install food_fish_parser
```

## Example

```ruby
require 'food_fish_parser'

s = "Pacifische kabeljauw (Gadus macrocephalus), gevangen in het " +
    "Noordoostelijke deel Stille oceaan (FAO 67) met trawlnetten, haken en lijnen"
parser = FoodFishParser::Parser.new
puts parser.parse(s).to_a.inspect
```
Results in a list of detected fishes
```ruby
[
  {
    :names => [
      { :common => "Pacifische kabeljauw", :latin => "Gadus macrocephalus" }
    ],
    :catch_areas => [
      { :text => "het Noordoostelijke deel Stille oceaan", :fao_codes=>["67"] }
     ],
    :catch_methods => [
      { :text => "trawlnetten, haken en lijnen" }
    ]
  }
]
```


## Test data

[`data/fish-ingredient-samples-qm-nl`](data/fish-ingredient-samples-qm-nl) contains about 2k 
real-world ingredient lists with fish found on the Dutch market. Each line contains one ingredient
list (newlines are encoded as `\n`, empty lines and those starting with `#` are ignored).


## Species

This gem does very basic named entity recognition of fish names. There are more fish names than the
parser can handle, so the detected fish names are limited to those actually found in packaged food products.
At the moment only a very limited number of names is detected. To add more, expand the _species-found_ text
files in [species/](species/) and run `species/species-treetop-gen.sh`. This updates the fish name grammars.


## License

This software is distributed under the [MIT license](LICENSE). Data may have a [different license](data/README.md).
