require 'benchmark/plot'

class TestArray
  attr_reader :arr

  def initialize arr
    @arr = arr
  end

  def to_s
    @arr.size.to_s
  end
end

test_data = [5, 25, 50, 75, 100, 125, 150, 175, 200,250,300]
test_data.map! {|e| TestArray.new(Array.new(e) {|i| i}) }

Benchmark.plot(test_data) do |x|
  x.report("map.flatten") do |data|
    data.arr.map { [nil]  }.flatten
  end

  x.report("flat_map") do |data|
    data.arr.flat_map { [nil] }
  end
end