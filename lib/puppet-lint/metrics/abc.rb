require 'puppet'

class PuppetLint
  module Metrics
    class Abc
      attr_reader :metrics

      def initialize()
        @@abc_visitor ||= Puppet::Pops::Visitor.new(nil, "abc", 0, 0)
        @metrics = {
          assignment: 0,
          branch: 0,
          conditional: 0,
        }
      end

      def compute(target)
        target.eAllContents.each { |m| abc(m) }
        [@metrics, Math.sqrt(@metrics[:assignment]**2 + @metrics[:branch]**2 + @metrics[:conditional]**2).round(2)]
      end

      def abc(o)
        @@abc_visitor.visit_this_0(self, o)
      end

      def abc_Object(o)
        nil
      end

      def conditional
        @metrics[:conditional] += 1
      end

      def branch
        @metrics[:branch] += 1
      end

      def assignment
        @metrics[:assignment] += 1
      end

      def abc_AssignmentExpression(o)
        assignment
      end

      def abc_AttributeOperation(o)
        assignment
      end

      def abc_ResourceExpression(o)
        branch
      end

      def abc_CollectorExpression(o)
        branch
      end

      def abc_CallExpression(o)
        branch
      end

      def abc_BlockExpression(o)
        branch
      end

      def abc_EqualityExpression(o)
        conditional
      end

      def abc_MatchExpression(o)
        conditional
      end

      def abc_NotMatchExpression(o)
        conditional
      end

      def abc_ComparisonExpression(o)
        conditional
      end

      def abc_InExpression(o)
        conditional
      end

      def abc_NotExpression(o)
        conditional
      end

      def abc_IfExpression(o)
        conditional
      end

      def abc_UnlessExpression(o)
        conditional
      end

      def abc_CaseExpression(o)
        conditional
      end

      def abc_SelectorExpression(o)
        conditional
      end
    end
  end
end
