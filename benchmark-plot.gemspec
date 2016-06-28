# coding: utf-8
$:.unshift File.expand_path("../lib", __FILE__)

require 'benchmark/plot/version.rb'

Benchmark::Plot::DESCRIPTION = <<MSG
benchmark-plot is an extension to the Ruby standard benchmarking library.

It let's you easily create plots of any code that you want to benchmark over 
a varied number of inputs. It also supports comparative benchmarking.
MSG

Gem::Specification.new do |spec|
  spec.name          = 'benchmark-plot'
  spec.version       = Benchmark::Plot::VERSION
  spec.authors       = ['Sameer Deshmukh']
  spec.email         = ['sameer.deshmukh93@gmail.com']
  spec.summary       = %q{benchmark-plot}
  spec.description   = Benchmark::Plot::DESCRIPTION
  spec.homepage      = "http://github.com/v0dro/benchmark-plot"
  spec.license       = 'BSD-2'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'gruff'
end
