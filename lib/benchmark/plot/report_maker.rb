module Benchmark
  module Plot
    class ReportMaker
      def initialize data
        @data = data
        @reports = {}
      end

      def report(label,&block)
        results_array = @data.each_with_object([]) do |d, results|
          lmb = lambda { block.call(d) }
          results << Benchmark.measure(label, &lmb)
        end
        @reports[label] = results_array
      end

      # An array of Benchmark::Tms objects representing each item.
      attr_reader :reports
    end
  end
end