# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'minitest/context/version'

Gem::Specification.new do |spec|
  spec.name          = "minitest-context"
  spec.version       = Minitest::Context::VERSION
  spec.authors       = ["Marcin Raczkowski"]
  spec.email         = ["marcin@arenaflowers.com"]
  spec.description   = %q{A very simple context support for minitest/unit}
  spec.summary       = %q{A very simple context support for minitest/unit}
  spec.homepage      = "https://arenaflowers.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency "minitest", '~> 5.8'
end
