require 'nmatrix'
require 'matrix'

test_data = [5,10,15,20,25,30,35]

Benchmark.plot(test_data) do |x, data|
  x.report("nmatrix creation") do
    Array.new(data) { |i|  i }
  end

  x.report("matrix creation") do
    Array.new(data) { |i|  i }
  end
end