# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "lib/version"

Gem::Specification.new do |s|
  s.name        = "devise-archangel"
  s.version     = DeviseArchangel::VERSION.dup
  s.platform    = Gem::Platform::RUBY
  s.summary     = "Extension to devise to allow authentication with Archangel"
  s.email       = "fxb9500@gmail.com"
  s.homepage    = "http://github.com/zeiv/devise-archangel"
  s.description = "Extension to devise to allow authentication with Archangel"
  s.authors     = ['Xavier Bick']

  s.rubyforge_project = "devise-archangel"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_dependency("devise")
end
