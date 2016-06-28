require 'benchmark'
require 'gruff'

require 'benchmark/plot/plotter'
require 'benchmark/plot/report_maker'
require 'benchmark/plot/version'

module Benchmark
  # Create a plot of the benchmarked code over a varied number of inputs.
  #
  # @param test_data [Enumerable] An object containing the data that is to be 
  #   used for the benchmarking. This object must be Enumerable, i.e. it must
  #   have the `#each` method defined. Each of the constituent objects of 
  #   `test_data` should have a `#to_s` method defined, which will be used for
  #   populating the X axis labels.
  # @param [Hash] opts The options for configuring the graph.
  # @option opts [Symbol, String] :title (:Benchmarks) Title of the graph.
  # @option opts [Symbol, String] :file_name (:benchmark_plot_graph) Name of 
  #   file to which plot is written.
  # @option opts [Symbol] :time (:real) The kind of time that should be displayed
  #   on the graph. Can be `:real` for elapsed real time, `:stime` for System 
  #   CPU time, `:utime` for User CPU time, `:cstime` for System CPU time of children,
  #   `:cutime` for User CPU time of children, and `:total` for the total time
  #   that is `:utime + :stime + :cutime + :cstime`.
  # @option opts [TrueClass, FalseClass] :x_labels (true) Whether you want X-axis
  #   labels or not.
  # @option opts [String, Symbol] :x_axis_label (nil) X-axis label string.
  # @example Benchmark map{}.flatten vs. flat_map
  #   require 'benchmark/plot'
  #   class TestArray
  #      attr_reader :arr
  # 
  #      def initialize arr
  #        @arr = arr
  #      end
  # 
  #      # The to_s method is called for populating the X axis labels.
  #      def to_s
  #        @arr.size.to_s
  #      end
  #    end
  # 
  #    test_data = [5, 25, 50, 75, 100, 125, 150, 175, 200,250,300]
  #    test_data.map! {|e| TestArray.new(Array.new(e) {|i| i}) }
  # 
  #    Benchmark.plot(test_data) do |x|
  #      x.report("map.flatten") do |data|
  #         # Here `data` will be of an object of type `TestArray`.
  #        data.arr.map { [nil]  }.flatten
  #      end
  # 
  #     x.report("flat_map") do |data|
  #       data.arr.flat_map { [nil] }
  #     end
  #   end
  def self.plot test_data, opts={}, &block
    include Benchmark::Plot

    reporter = ReportMaker.new(test_data)
    yield(reporter)
    plotter = Plotter.new reporter, test_data, opts
    plotter.plot
  end
end
