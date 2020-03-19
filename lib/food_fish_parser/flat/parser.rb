require_relative 'fish_name'
require_relative 'fao_region'
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
        methods = [] # @todo

        is_wild = Kind.is_wild?(s)
        is_aquac = Kind.is_aquac?(s)

        return [] unless names.any? || areas.any?

        attrs = {
          names: names,
          catch_areas: [],
          catch_methods: [],
          aquaculture_areas: [],
          aquaculture_methods: []
        }

        if is_wild && !is_aquac
          [attrs.merge(catch_areas: areas, catch_methods: methods)]
        elsif !is_wild && is_aquac
          [attrs.merge(aquaculture_areas: areas, aquaculture_methods: methods)]
        elsif areas.any? || methods.any?
          # We have a problem: either there are multiple fish and they're a mix of
          # wild and aquaculture fish, or there is no such indication at all.
          # For now, we return it in a non-standard way (this needs to be tackled).
          [attrs.merge(areas: areas, methods: methods)]
        else
          # just names
          [attrs]
        end
      end
    end
  end
end
