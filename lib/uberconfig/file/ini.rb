#!/usr/bin/env ruby

require 'uberconfig/line_parser'

module UberConfig 
  class INI < LineParser
    def initialize(*args)
      @regexes = {
        :comment => /^[#;]/,
        :value   => /(\S+)\s*=\s*(\S+)$/
      }

      super
    end

    def save(values)
      # Backup existing file here
      write do |file|
        values.each do |key,val|
          # This doesn't quite work right for complex types
          file.puts "%s = %s" % [key,val]
          file.puts
        end
      end
    end
  end
end
