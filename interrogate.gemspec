# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "interrogate/version"

Gem::Specification.new do |s|
  s.name        = "interrogate"
  s.version     = Interrogate::VERSION
  s.authors     = ["Morgan Brown"]
  s.email       = ["brown.mhg@gmail.com"]
  s.homepage    = ""
  s.summary     = "Scheme-like class predication for Ruby"
  s.description = "String?(\"Hello!\") Interrogate attempts to bring Scheme-like class predication to Ruby."

  s.rubyforge_project = "interrogate"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
end
