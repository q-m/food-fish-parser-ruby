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

### Strict parser

```ruby
require 'food_fish_parser'

s = <<EOT.gsub(/\n/, '').strip
  zalm (salmo salar), gekweekt in noorwegen, kweekmethode: kooien.pangasius
  (pangasius spp), gekweekt in vietnam,  kweekmethode: vijver. coquilles
  (placopecten magellanicus), vangstgebied noordwest atlantische oceaan fao 21,
  kabeljauw (gadus macrocephalus), vangstgebied stille oceaan fao 67, garnaal
  (litopenaeus vannamei), gekweekt in ecuador, kweekmethode: vijver.
EOT
parser = FoodFishParser::Strict::Parser.new
puts parser.parse(s).to_a.inspect
```

Results in a list of detected fishes

```ruby
[
  {
    :names =>               [{ :common=>"zalm", :latin=>"salmo salar" }],
    :catch_areas =>         [],
    :catch_methods =>       [],
    :aquaculture_areas =>   [{ :text=>"noorwegen", :fao_codes=>[] }],
    :aquaculture_methods => [{ :text=>"kooien" }]
  },
  {
    :names =>               [{ :common=>"pangasius", :latin=>"pangasius spp" }],
    :catch_areas =>         [],
    :catch_methods =>       [],
    :aquaculture_areas =>   [{ :text=>"vietnam", :fao_codes=>[] }],
    :aquaculture_methods => [{ :text=>"vijver" }]
  },
  {
    :names =>               [{ :common=>"coquilles", :latin=>"placopecten magellanicus" }],
    :catch_areas =>         [{ :text=>"noordwest atlantische oceaan", :fao_codes=>["21"] }],
    :catch_methods =>       [],
    :aquaculture_areas =>   [],
    :aquaculture_methods => []
  },
  {
    :names =>               [{ :common=>"kabeljauw", :latin=>"gadus macrocephalus" }],
    :catch_areas =>         [{ :text=>"stille oceaan", :fao_codes=>["67"] }],
    :catch_methods =>       [],
    :aquaculture_areas =>   [],
    :aquaculture_methods => []
  },
  {
    :names =>               [{ :common=>"garnaal", :latin=>"litopenaeus vannamei" }],
    :catch_areas =>         [],
    :catch_methods =>       [],
    :aquaculture_areas =>   [{ :text=>"ecuador", :fao_codes=>[] }],
    :aquaculture_methods => [{ :text=>"vijver" }]
  }
]
```

### Anywhere

When you have a piece of text and don't know where (or if) any fish details are
present, you can use the `anywhere` option.

```ruby
require 'food_fish_parser'

parser = FoodFishParser::Strict::Parser.new
s = "tomaat, vis (zalm (salmo salar) gevangen in Noorwegen), zout"
puts parser.parse(s, anywhere: true).to_a.inspect
```

This will find as many occurences as possible. It is assumed that all fish details
in the text have the same amount of information (so fish name plus catch or aquaculture
information, or only fish names, or only catch or aquaculture information).
While the parser would normally return nothing, with `anywhere` it returns:

```ruby
[
  {
    :names               => [{ :common=>"zalm", :latin=>"salmo salar" }],
    :catch_areas         => [{ :text=>"Noorwegen", :fao_codes=>[] }],
    :catch_methods       => [],
    :aquaculture_areas   => [],
    :aquaculture_methods => []
  }
]
```

Please note that the `anywhere` option can make the parser much slower.

### Flat parser

While the strict parser can recognize the structure of multiple fishes, it is really
strict about what it expects. Many cases are not recognized, or sometimes incomplete.

The flat parser does basic named entity recognition anywhere in the text. Any structure
is lost, so it always returns an array with one or zero items - but you get all the
FAO regions and fish names found.

```ruby
require 'food_fish_parser'

parser = FoodFishParser::Flat::Parser.new
s = "Foobar zalm (salmo salar) *&! gevangen met lijnen pangasius spp FAO 61 ?or ?FAO 67 what more.")
puts parser.parse(s).to_a.inspect
```

```ruby
[
  {
    :names => [
      { :common=>"zalm", :latin=>"salmo salar" },
      { :common=>nil, :latin=>"pangasius spp" }
    ],
    :catch_areas => [
      { :name=>nil, :fao_codes=>["61"] },
      { :name=>nil, :fao_codes=>["67"] }
    ],
    :catch_methods       => [{ :text=>"lijnen" }],
    :aquaculture_areas   => [],
    :aquaculture_methods => []
  }
]
```

This might be expanded to more information at some point.


## Test tool

The executable `food_fish_parser` is available after installing the gem. If you're
running from the source tree, use `bin/food_fish_parser` instead.

```
$ food_fish_parser -h
Usage: bin/food_fish_parser [options] --file|-f <filename>
       bin/food_fish_parser [options] --string|-s <text>

    -f, --file FILE                  Parse all lines of the file as fish detail text.
    -s, --string TEXT                Parse specified fish detail text.
    -q, --[no-]quiet                 Only show summary.
    -p, --parsed                     Only show lines that were successfully parsed.
    -n, --noresult                   Only show lines that had no result.
    -r, --parser PARSER              Use specific parser (strict, flat).
    -a, --[no-]anywhere              Search for fish details anywhere in the text.
    -e, --[no-]escape                Escape newlines
    -c, --[no-]color                 Use color
    -v, --[no-]verbose               Show more data (parsed tree).
        --version                    Show program version.
    -h, --help                       Show this help

$ food_fish_parser -v -s "salmo salar"
"salmo salar"
SyntaxNode+Root6+RootNode+SyntaxNodeAdditions offset=0, "salmo salar" (to_a,to_a_deep):
  SyntaxNode+Root3 offset=0, "salmo salar" (fish_only_names):
    SyntaxNode+FishNode+SyntaxNodeAdditions+FishNameList1 offset=0, "salmo salar" (to_h,to_a_deep,fish_name):
      SyntaxNode+FishNameNode+SyntaxNodeAdditions+FishNameLatin1+FishNameLatinNode offset=0, "salmo salar" (to_h,to_a_deep,fish_name_latin_first):
        SyntaxNode offset=0, "salmo"
        SyntaxNode+FishNameLatin0 offset=5, " salar" (fish_name_latin_second):
          SyntaxNode offset=5, " ":
            SyntaxNode offset=5, " "
          SyntaxNode offset=6, "salar"
      SyntaxNode offset=11, ""
    SyntaxNode offset=11, ""
  SyntaxNode offset=11, ""
  SyntaxNode offset=11, ""
  SyntaxNode offset=11, ""
[
  {
    :names=>[{:common=>nil, :latin=>"salmo salar"}],
    :catch_areas=>[],
    :catch_methods=>[],
    :aquaculture_areas=>[],
    :aquaculture_methods=>[]
  }
]

$ food_fish_parser -q -f data/test-cases
parsed 51 (100.0%), no result 0 (0.0%)
```

If you want to use the output in (shell)scripts, the options `-e -c` may be quite useful.


## Test data

[`data/fish-ingredient-samples-qm-nl`](data/fish-ingredient-samples-qm-nl) contains about 2k
real-world ingredient lists with fish found on the Dutch market. Each line contains one ingredient
list (newlines are encoded as `\n`, empty lines and those starting with `#` are ignored). Of those,
something is returned for 99.8% of them (with the `anywhere` option), but quality varies greatly.


## Species

This gem does very basic named entity recognition of fish names. There are more fish names than the
parser can handle, so the detected fish names are limited to those actually found in packaged food products.
At the moment only a very limited number of names is detected. To add more, expand the _species-found_ text
files in [species/](species/) and run `species/species-treetop-gen.sh`. This updates the fish name grammars.


## License

This software is distributed under the [MIT license](LICENSE). Data may have a [different license](data/README.md).
