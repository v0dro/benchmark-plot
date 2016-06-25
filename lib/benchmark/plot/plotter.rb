module Benchmark
  module Plot
      class Plotter
        def initialize reporter, test_data, opts
          @reporter = reporter
          @file_name = opts[:file_name] || :benchmark_plot_file
          @title = opts[:title] || :Benchmarks
          @time = opts[:time] || :real
          @x_labels = opts[:x_labels] || true
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
          plot.write("#{@file_name}.png")
        end

        def all_labels
          @reporter.reports.keys
        end
      end
    end
  end
end