#!/usr/bin/env ruby

require 'uberconfig'
require 'uberconfig/file/yaml'
require 'uberconfig/file/ini'
require 'pry'

cfg      = UberConfig::Config.new

yaml     = UberConfig::YAML.new('local_yaml','data/test.yml')
ini      = UberConfig::INI.new('local_ini','data/test.ini')

new_ini  = UberConfig::INI.new('user_ini','data/new.ini',{:writable => true})
new_yaml = UberConfig::YAML.new('user_yml','data/new.yml',{:writable => true})

cfg.add_config(yaml,ini)

binding.pry
