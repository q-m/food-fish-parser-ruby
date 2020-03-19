#!/bin/sh
#
# Updates the generated treetop files from found species.
#
cd `dirname "$0"`
for lang in latin nl; do
  ruby species-treetop-gen-$lang.rb strict <species-found-$lang.txt >../lib/food_fish_parser/strict/grammar/fish_name_$lang.treetop
  ruby species-treetop-gen-$lang.rb flat <species-found-$lang.txt >../lib/food_fish_parser/flat/fish_name_$lang.rb
done
