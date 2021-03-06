# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gmo-payment-carrier/version"

Gem::Specification.new do |spec|
  spec.name          = "gmo-payment-carrier"
  spec.version       = GMOPaymentCarrier::VERSION
  spec.authors       = ["pocake"]
  spec.email         = ["info@pieceofcake.co.jp"]

  spec.summary       = %q{ gmo-payment-carrier. }
  spec.description   = %q{ gmo-payment-carrier. }
  spec.homepage      = "https://github.com/pocake/gmo-payment-carrier"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "faraday"
  spec.add_runtime_dependency "activesupport"
  spec.add_runtime_dependency "activemodel"
  spec.add_runtime_dependency "rack"
  spec.add_runtime_dependency "retriable"
  spec.add_runtime_dependency "hashie"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "3.3.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "ffaker"
end
