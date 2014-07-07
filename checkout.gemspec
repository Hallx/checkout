# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'checkout/version'

Gem::Specification.new do |spec|
  spec.name          = "checkout"
  spec.version       = Checkout::VERSION
  spec.authors       = ["Faheem Mughal"]
  spec.email         = ["faheem@gmail.com"]
  spec.summary       = %q{Simple checkout system}
  spec.description   = %q{A simple checkout system to calculate total and apply current promotions.}
  spec.homepage      = "https://github.com/Hallx/checkout"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "factory_girl"
  spec.add_development_dependency "byebug"
end
