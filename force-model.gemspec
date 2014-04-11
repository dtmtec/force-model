# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'force/model/version'

Gem::Specification.new do |spec|
  spec.name          = "force-model"
  spec.version       = Force::Model::VERSION
  spec.authors       = ["Vicente Mundim"]
  spec.email         = ["vicente.mundim@gmail.com"]
  spec.summary       = %q{Integrate with salesforce by declaring your models.}
  spec.description   = %q{Integrate with salesforce by declaring your models.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", ">= 3.2.17"
  spec.add_dependency "activemodel", ">= 3.2.17"
  spec.add_dependency "restforce"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
