require_relative 'fish_name'
require_relative 'fao_region'
require_relative 'catch_method'
require_relative 'aquac_method'
require_relative 'kind'

module FoodFishParser
  module Flat
    class Parser

      # Create a new fish detail parser
      # @return [FoodFishParser::Flat::Parser]
      def initialize
      end

      # Parse food fish text into a structured representation.
      #
      # @param s [String] text to parse
      # @return [Array<Hash>] structured representation of fish details (maximum one item)
      def parse(s, **options)
        names = FishName.find_all(s)
        areas = FaoRegion.find_all(s)
        catch_methods = CatchMethod.find_all(s)
        aquac_methods = AquacMethod.find_all(s)

        is_wild = catch_methods.any? || Kind.is_wild?(s)
        is_aquac = aquac_methods.any? || Kind.is_aquac?(s)

        return [] unless names.any? || aquac_methods.any? || catch_methods.any? || areas.any?

        attrs = {
          names: names,
          catch_areas: [],
          catch_methods: catch_methods,
          aquaculture_areas: [],
          aquaculture_methods: aquac_methods
        }

        if is_wild && !is_aquac
          [attrs.merge(catch_areas: areas)]
        elsif !is_wild && is_aquac
          [attrs.merge(aquaculture_areas: areas)]
        elsif areas.any?
          # We have a problem: either there are multiple fish and they're a mix of
          # wild and aquaculture fish, or there is no such indication at all.
          # For now, we return it in a non-standard way (this needs to be tackled).
          [attrs.merge(areas: areas)]
        else
          # just names
          [attrs]
        end
      end
    end
  end
end
