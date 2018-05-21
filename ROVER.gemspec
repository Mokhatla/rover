# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "ROVER"
  spec.version       = '0.1'
  spec.authors       = ["Retsilisitsoe Mokhatla"]
  spec.email         = ["mokhatla@hotmail.com"]
  spec.summary       = %q{Mars Rover Challenge}
  spec.description   = %q{Mars Rover Challenge}
  spec.homepage      = "http://www.4tastesa.com/"
  spec.license       = "MIT"

  spec.files         = ['lib/ROVER.rb']
  spec.executables   = ['bin/ROVER']
  spec.test_files    = ['tests/test_ROVER.rb']
  spec.require_paths = ["lib"]
end
