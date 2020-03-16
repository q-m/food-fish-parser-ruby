require_relative 'grammar'

module FoodFishParser
  class Parser

    # @!attribute [r] parser
    #   @return [Treetop::Runtime::CompiledParser] low-level parser object
    #   @note This attribute is there for convenience, but may change in the future. Take care.
    attr_reader :parser

    # Create a new fish detail parser
    # @return [FoodFishParser::Parser]
    def initialize
      @parser = Grammar::RootParser.new
    end

    # Parse food fish text into a structured representation.
    #
    # @return [FoodFishParser::Grammar::RootNode] structured representation of fish details
    # @note Unrecognized options are passed to Treetop, but this is not guarenteed to remain so forever.
    def parse(s, **options)
      @parser.parse(s, **options)
    end

  end
end
