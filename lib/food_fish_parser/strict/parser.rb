require_relative 'grammar'

module FoodFishParser
  module Strict
    class Parser

      # @!attribute [r] parser
      #   @return [Treetop::Runtime::CompiledParser] low-level parser object
      #   @note This attribute is there for convenience, but may change in the future. Take care.
      attr_reader :parser

      # Create a new fish detail parser
      # @return [FoodFishParser::Strict::Parser]
      def initialize
        @parser = Grammar::RootParser.new
      end

      # Parse food fish text into a structured representation.
      #
      # @param s [String] text to parse
      # @param anywhere [Bool] +false+ assume the text is only fish details, +true+ to search for fish details in the text
      # @return [FoodFishParser::Strict::Grammar::RootNode] structured representation of fish details
      # @note Unrecognized options are passed to Treetop, but this is not guarenteed to remain so forever.
      def parse(s, anywhere: false, **options)
        if anywhere
          options = options.merge(root: :root_anywhere, consume_all_input: false)
        end

        @parser.parse(s, **options)
      end

    end
  end
end
