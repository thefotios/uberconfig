#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
require 'uberconfig/version'
 
Gem::Specification.new do |s|
  s.name        = "uberconfig"
  s.version     = UberConfig::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Fotios Lindiakos"]
  s.email       = ["fotioslindiakos@gmail.com"]
  s.homepage    = "http://github.com/fotioslindiakos/uberconfig"
  s.summary     = "An improved configuration file parses/generator"
  s.description = "The last config file library you'll ever need"
 
  s.require_path = 'lib'

  s.files       += %w(LICENSE README.md)
  s.files       += Dir.glob("lib/**/*") 

  s.add_development_dependency "pry"
end
