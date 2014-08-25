# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bim360/version'

Gem::Specification.new do |spec|
  spec.name          = "bim360"
  spec.version       = Bim360::VERSION
  spec.authors       = ["Markus Klooth"]
  spec.email         = ["mklooth@webcor.com"]
  spec.summary       = "Rest API for Autodesk BIM 360 Field"
  spec.description   = "Rest API for Autodesk BIM 360 Field"
  spec.homepage      = "https://github.com/markusklooth/bim360"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 1.9.3'


  spec.add_dependency('sawyer', '~> 0.5.5')
  spec.add_dependency('multi_json', '>= 1.3.0')
  spec.add_dependency('faraday', ">= 0.9")
  spec.add_dependency('rest_client', '>= 1.7.2')
  spec.add_dependency('builder', '>= 2.1.2')
  # spec.add_dependency('cgi', '>= 1.7.2')


  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
