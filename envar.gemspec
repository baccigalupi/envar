# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'envar/version'

Gem::Specification.new do |spec|
  spec.name          = "envar"
  spec.version       = Envar::VERSION
  spec.authors       = ["Kane Baccigalupi"]
  spec.email         = ["baccigalupi@gmail.com"]
  spec.description   = %q{Envar is a simple wrapper around your environmental variables to ease development and testing}
  spec.summary       = %q{Envar is a simple wrapper around your environmental variables to ease development and testing}
  spec.homepage      = "http://github.com/baccigalupi/envar"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'dotenv'
  spec.add_runtime_dependency 'activesupport', '>= 3.0'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec'
end
