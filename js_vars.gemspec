# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'js_vars/version'

Gem::Specification.new do |spec|
  spec.name          = "js_vars"
  spec.version       = JsVars::VERSION
  spec.authors       = ["Jiren Patel"]
  spec.email         = ["jirenpatel@gmail.com"]
  spec.description   = %q{Manage javascript variables in html templates}
  spec.summary       = %q{Manage javascript variables in html templates}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
