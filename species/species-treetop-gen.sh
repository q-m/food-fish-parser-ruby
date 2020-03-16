#!/bin/sh
#
# Updates the generated treetop files from found species.
#
cd `dirname "$0"`
for lang in latin nl; do
  ruby species-treetop-gen-$lang.rb <species-found-$lang.txt >../lib/food_fish_parser/grammar/fish_name_$lang.treetop
done
