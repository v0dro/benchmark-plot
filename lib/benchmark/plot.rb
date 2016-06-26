require 'benchmark'
require 'gruff'

require 'benchmark/plot/plotter'
require 'benchmark/plot/report_maker'
require 'benchmark/plot/version'

module Benchmark
  def self.plot test_data, opts={}, &block
    include Benchmark::Plot

    reporter = ReportMaker.new(test_data)
    yield(reporter)
    plotter = Plotter.new reporter, test_data, opts
    plotter.plot
  end
end
