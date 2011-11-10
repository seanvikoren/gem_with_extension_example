# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "gem_with_extension_example/version"

Gem::Specification.new do |s|
  s.name        = "gem_with_extension_example"
  s.version     = GemWithExtensionExample::VERSION
  s.authors     = ["Sean Vikoren"]
  s.email       = ["sean@vikoren.com"]
  s.homepage    = ""
  s.summary     = %q{An example gem with a C extention.}
  s.description = %q{This gem is intended to function as a starting point for developing gems that contain C optimizations.}

  s.rubyforge_project = "gem_with_extension_example"

  s.files         = Dir.glob("{ext,lib}/**/*.{c,rb,bundle}")
  #s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # dependencies
  s.add_development_dependency "rake-compiler"
  #s.add_runtime_dependency ""
end
