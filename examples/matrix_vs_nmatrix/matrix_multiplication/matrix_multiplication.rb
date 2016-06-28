require 'benchmark/plot'
require 'matrix'
require 'nmatrix'
require 'nmatrix/atlas'

sizes = [5, 10, 50, 100, 150, 200]

Benchmark.plot sizes, title: "Matrix multiplication",
  file_name: "matrix_multiplication" do |x|
  x.report "NMatrix with ATLAS" do |size|
    n = NMatrix.new([size,size], [1]*size*size, dtype: :float32)
    n.dot(n)
  end

  x.report "Matrix" do |size|
    n = Matrix[*[[1]*size]*size]
    n * n
  end
end