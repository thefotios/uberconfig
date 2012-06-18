#!/usr/bin/env ruby

require 'yaml'
require 'uberconfig/file'

module UberConfig 
  class YAML < File
    def parse_config
      @values = ::YAML.load_file(path)
    end

    def save(values)
      write do |file|
        file.puts ::YAML.dump(values)
      end
    end
  end
end
