test_data = [5, 25, 50, 75, 100, 125, 150, 175, 200,250,300]
test_data.map! {|e| Array.new(e) {|i| i} }

Benchmark.plot(test_data) do |x|
  x.report("map.flatten") do |data|
    data.map { [nil]  }.flatten
  end

  x.report("flat_map") do |data|
    data.flat_map { [nil] }
  end
end
