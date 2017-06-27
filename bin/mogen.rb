# coding: utf-8
lib = File.expand_path('../../lib/**/*', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'mogen'
  spec.version       = '1.0'
  spec.authors       = ['Rya Brody']
  spec.email         = ["franca__rast@hotmail.com"]
  spec.summary       = %q{Automated instagram liker}
  spec.description   = %q{Mogen searches for tags on instagram.com and likes automaticly but without verifying the resulted posts.}
  spec.homepage      = "TODO"
  spec.license       = "MIT"

  spec.files         = ['lib/mogen.rb']
  spec.executables   = ['bin/mogen']
  spec.require_paths = ['lib']
end
