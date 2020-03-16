require 'treetop/runtime'

# Needs to be in grammar namespace so Treetop can find the nodes.
module FoodFishParser
  module Grammar

    # Additions for Treetop nodes, include this in other nodes where needed.
    module SyntaxNodeAdditions
      def to_a_deep(n, cls)
        if n.is_a?(cls)
          [n]
        elsif n.nonterminal?
          n.elements.map {|m| to_a_deep(m, cls) }.flatten(1).compact
        end
      end
    end

    # Root object, contains everything else.
    module RootNode
      include SyntaxNodeAdditions
      def to_a
        to_a_deep(fishes, FishNode).map(&:to_h)
      end
    end

    module FishNode
      include SyntaxNodeAdditions
      def to_h
        {
          names: to_a_deep(self, FishNameNode).map(&:to_h),
          catch_areas: to_a_deep(self, CatchAreaNode).map(&:to_h),
          catch_methods: to_a_deep(self, CatchMethodNode).map(&:to_h),
          aquaculture_areas: to_a_deep(self, AquacAreaNode).map(&:to_h),
          aquaculture_methods: to_a_deep(self, AquacMethodNode).map(&:to_h),
        }
      end
    end

    module FishNameNode
      include SyntaxNodeAdditions
      def to_h
        {
          common: to_a_deep(self, FishNameCommonNode).first&.text_value,
          latin: to_a_deep(self, FishNameLatinNode).first&.text_value
        }
      end
    end

    module FishNameCommonNode; end
    module FishNameLatinNode; end

    module CatchAreaNode
      include SyntaxNodeAdditions
      def to_h
        {
          text: area.text_value,
          fao_codes: to_a_deep(self, FaoAreaCodeNode).map(&:text_value)
        }
      end
    end

    module FaoAreaCodeNode; end

    module CatchMethodNode
      def to_h
        {
          text: self.text_value
        }
      end
    end

    module AquacAreaNode
      include SyntaxNodeAdditions
      def to_h
        {
          text: area.text_value,
          fao_codes: to_a_deep(self, FaoAreaCodeNode).map(&:text_value)
        }
      end
    end

    module AquacMethodNode
      def to_h
        {
          text: self.text_value
        }
      end
    end

  end
end
