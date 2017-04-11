# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yai/version'

Gem::Specification.new do |spec|
  spec.name          = 'yai'
  spec.version       = Yai::VERSION
  spec.authors       = ['Mario Fernandez']
  spec.email         = ['mario.fernandez@xing.com']

  spec.summary       = 'You Are It, the definitive gem to assign PRs'
  spec.homepage      = 'https:://www.github.com/sirech/yai'
  spec.license       = 'MIT'

  spec.required_ruby_version = '~> 2.3.0'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = ['yai']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'

  spec.add_development_dependency 'rspec', '~> 3.0'

  spec.add_development_dependency 'pry', '~> 0.10.4'

  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'overcommit'

  spec.add_runtime_dependency 'thor', '~> 0.19.4'
  spec.add_runtime_dependency 'octokit', '~> 4.3.0'
  spec.add_runtime_dependency 'activesupport', '~> 5.0.2'
  spec.add_runtime_dependency 'highline', '~> 1.7.8'
  spec.add_runtime_dependency 'colorize', '~> 0.8.1'
end
