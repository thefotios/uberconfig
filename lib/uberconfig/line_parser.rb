#!/usr/bin/env ruby

require 'uberconfig/file'

module UberConfig 
  class LineParser < File
    def parse_config
      ::File.open(path) do |file|
        file.each do |line|
          line.strip!
          case line
          when @regexes[:comment]
            next
          when @regexes[:value]
            @values[$1] = $2
          end
        end
      end
    end
  end
end
