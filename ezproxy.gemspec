# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ezproxy/version"

Gem::Specification.new do |s|
  s.name        = "ezproxy"
  s.version     = EZproxy::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Brice Stacey"]
  s.email       = ["bricestacey@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{General use library for OCLC's EZproxy}
  s.description = %q{General use library for OCLC's EZproxy}

  s.rubyforge_project = "ezproxy"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency('rspec')
end
