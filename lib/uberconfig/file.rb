#!/usr/bin/env ruby

module UberConfig 
  class File
    include Logging

    attr_reader :name, :path
    attr_reader :values

    def initialize(name,path,opts = {})
      logger.debug "Creating new config file: #{name}"

      @name   = name
      @path   = path
      @values = {}

      opts.each do |k,v|
        instance_variable_set "@#{k}", v
      end

      if exists?
        parse_config
      end
    end

    def writable?
      @writable && can_write?
    end

    def exists?
      ::File.exists?(path)
    end

    def write
      ::File.open(path,'w') do |file|
        yield file
      end
    end

    private
    def can_write?
      if exists?
        ::File.writable?(path)
      else
        begin
        ::File.open(path,'w') do |f|
          return true
        end
        rescue Errno::EACCES
          return false
        end
      end
    end
  end
end
