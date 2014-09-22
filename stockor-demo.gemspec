# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'skr/demo/version'

Gem::Specification.new do |spec|
    spec.name          = "stockor-demo"
    spec.version       = Skr::Demo::VERSION
    spec.authors       = ["Nathan Stitt"]
    spec.email         = ["nathan@stitt.org"]
    spec.summary       = %q{Stockor Demo replaces the stock login form with a pre-filled roles}
    spec.description   = %q{Stockor Demo replaces the stock login form with a pre-filled roles}
    spec.homepage      = ""
    spec.license       = "GPL-3.0"

    spec.files         = `git ls-files -z`.split("\x0")
    spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
    spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
    spec.require_paths = ["lib"]

    spec.add_development_dependency "bundler", "~> 1.5"
    spec.add_development_dependency "rake"
end
