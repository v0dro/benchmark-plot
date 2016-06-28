module Benchmark
  module Plot
    class Plotter
      def initialize reporter, test_data, opts
        @reporter  = reporter
        @file_name = opts[:file_name] || :benchmark_plot_graph
        @title     = opts[:title] || :Benchmarks
        @time      = opts[:time] || :real
        @x_labels  = opts[:x_labels] || true
        @x_axis_label = opts[:x_axis_label]
        @test_data = test_data
      end

      def plot
        plot = Gruff::Line.new
        plot.title = @title.to_s
        reports = @reporter.reports

        reports.each do |label, report|
          time_data = report.map do |tms|
            tms.send(@time)
          end
          plot.data label, time_data
        end
        positions = Array.new(@test_data.size) { |i| i }
        plot.labels = positions.zip(@test_data.map(&:to_s)).to_h if @x_labels
        plot.x_axis_label = @x_axis_label if @x_axis_label
        plot.y_axis_label = 'Seconds'
        plot.write("#{@file_name}.png")
      end

      def all_labels
        @reporter.reports.keys
      end
    end
  end
end