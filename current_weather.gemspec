# -*- encoding: utf-8 -*-
require File.expand_path('../lib/current_weather/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["michael verdi"]
  gem.email         = ["michael.v.verdi@gmail.com"]
  gem.description   = %q{google weather wrapper for ruby}
  gem.summary       = %q{google weather wrapper for ruby}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "current_weather"
  gem.require_paths = ["lib"]
  gem.version       = Weather::VERSION

  gem.add_runtime_dependency('faraday')
  gem.add_runtime_dependency('nokogiri')
end
