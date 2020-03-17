$:.unshift(File.expand_path(File.dirname(__FILE__) + '/lib'))
require 'food_fish_parser/version'

Gem::Specification.new do |s|
  s.name             = 'food_fish_parser'
  s.version          = FoodFishParser::VERSION
  s.date             = FoodFishParser::VERSION_DATE
  s.summary          = 'Parser for fish details found on food products.'
  s.authors          = ['wvengen']
  s.email            = ['dev-ruby@willem.engen.nl']
  s.homepage         = 'https://github.com/q-m/food-fish-parser-ruby'
  s.license          = 'MIT'
  s.description      = <<-EOD
    Food products that contain fish sometimes indicate details like fishing
    area, method or aquaculture country. This parser knows about various ways
    this is found on a product package, and returns a structured representation
    of the fish ingredient details.
  EOD
  s.metadata         = {
    'bug_tracker_uri' => 'https://github.com/q-m/food-fish-parser-ruby/issues',
    'source_code_uri' => 'https://github.com/q-m/food-fish-parser-ruby',
  }

  s.files            = `git ls-files *.gemspec lib`.split("\n")
  s.executables      = `git ls-files bin`.split("\n").map(&File.method(:basename))
  s.extra_rdoc_files = ['README.md', 'LICENSE']
  s.require_paths    = ['lib']

  s.add_runtime_dependency 'treetop', '~> 1.6'
end
