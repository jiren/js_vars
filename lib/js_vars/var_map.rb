module JsVars
  class VarMap < Hash

    class << self

      def get
        Thread.current['[jsvar]:map'] ||= JsVars::VarMap.new
      end

      def add(vars, namepsace)
        var_map = self.get
        var_map[namepsace] ||= {}
        var_map[namepsace].merge!(vars)
      end

      def clear
        self.get.clear
      end

      def empty?
        self.get.empty?
      end

    end

  end
end
