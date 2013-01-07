# -*- encoding: utf-8 -*-
require File.expand_path('../lib/corset/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Maximilian Schoening, Eric Holmes"]
  gem.email         = ["mschoening@me.com, eric@ejholmes.net"]
  gem.description   = %q{A ruby gem to set the right CORS configuration for an S3 bucket.}
  gem.summary       = %q{A ruby gem to set the right CORS configuration for an S3 bucket.}
  gem.homepage      = "https://github.com/max/corset"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "corset"
  gem.require_paths = ["lib"]
  gem.version       = Corset::VERSION

  gem.add_dependency 'fog'
  gem.add_dependency 'thor'
end
