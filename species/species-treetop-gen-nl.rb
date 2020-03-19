#!/usr/bin/env ruby
#
# Generate treetop fish species grammar from regular fish names on standard input.
#
# Many fishes can be prefixed by a sea or ocean name. To reduce size and increase
# matches, we remove the areas when reading, and allow them to be optionally present
# in the grammar. The same is done for colors.
#
# Note that the order of items is relevant, because Treetop is a greedy non-backtracking
# parser. Put the longest item first, so that we get +'groene' / 'groen'+ instead of the
# other way around.
#
require 'set'
require 'date'

names = Set.new

areas = %w(
  atlantische alaska argentijnse groenlandse indische pacifische noorse
).sort_by(&:length).reverse
attrs = %w(
  witte wit witpoot rood rode roze blauwe blauw groene groen zwarte zwart
  coho doorn chum pijl groot grote klein kleine rivier
).sort_by(&:length).reverse
suffixes = %w(
  filets filet vlees ring ringen
)

names = Set.new

STDIN.each_line(chomp: true) do |line|
  line.gsub!(/\s*#.*\z/, '') # remove comments
  next if line.strip == ''
  name = line.strip.downcase
  name.gsub!(/\A#{Regexp.union(areas.map(&Regexp.method(:escape)))}/, '')
  name.gsub!(/\A#{Regexp.union(attrs.map(&Regexp.method(:escape)))}/, '')
  name.gsub!(/#{Regexp.union(suffixes.map(&Regexp.method(:escape)))}\z/, '')
  names.add(name.strip)
end

if ARGV[0] == 'strict'
puts <<EOF
# autogenerated by #{File.basename(__FILE__)} on #{Date.today}
module FoodFishParser::Strict::Grammar
  grammar FishNameNL
    include Common

    rule fish_name_nl
      ( 'verse'i ws+ )?
      ( fish_name_nl_area ws+ )? ( fish_name_nl_attr ws* )? fish_name_nl_name fish_name_nl_suffix?
      <FishNameCommonNode>
    end

    rule fish_name_nl_area
      #{areas.sort.reverse.map {|s| "'#{s}'i" }.join(" / ")}
    end

    rule fish_name_nl_attr
      #{attrs.sort.reverse.map {|s| "'#{s}'i" }.join(" / ")}
    end

    rule fish_name_nl_name
      #{names.sort.reverse.map {|s| "'#{s}'i" }.join(" / ")}
    end

    rule fish_name_nl_suffix
      #{suffixes.sort.reverse.map {|s| "'#{s}'i" }.join(" / ")}
    end
  end
end
EOF

elsif ARGV[0] == 'flat'
puts <<EOF
# autogenerated by #{File.basename(__FILE__)} on #{Date.today}
module FoodFishParser
  module Flat
    module FishNameNL
      REGEX_AREA = /#{areas.sort.reverse.map {|s| Regexp.escape(s) }.join("|")}/i
      REGEX_ATTR = /#{attrs.sort.reverse.map {|s| Regexp.escape(s) }.join("|")}/i
      REGEX_NAME = /#{names.sort.reverse.map {|s| Regexp.escape(s) }.join("|")}/i
      REGEX_SUFX = /#{suffixes.sort.reverse.map {|s| Regexp.escape(s) }.join("|")}/i

      REGEX = /
        (?: \\b verse \\s+ )?
        \\b
        (
          (?: \#{REGEX_AREA} \\s+ )? (?: \#{REGEX_ATTR} \\s* )? \#{REGEX_NAME} (?: \#{REGEX_SUFX} )?
        )
        \\b
      /ix
    end
  end
end
EOF

else
STDERR.puts "Please give 'strict' or 'flat' as argument."

end
