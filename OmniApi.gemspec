# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omni_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'OmniApi'
  spec.version       = OmniApi::VERSION
  spec.authors       = ['Cristi Badila']
  spec.email         = ['cristi.badila@gmail.com']
  spec.summary       = %q{A gem used to make using OmniApi easier}
  spec.description   = %q{}
  spec.homepage      = 'https://github.com/cristi-badila/OmniApiGem/tree/master'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activeresource', '~> 4.0.0'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-its'
end
