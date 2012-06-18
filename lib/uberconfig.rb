#!/usr/bin/env ruby
require 'logging'

module UberConfig 
  class Config
    include Logging

    attr_reader :configs, :values

    def initialize(*configs)
      logger.debug "Initializing"
      @values  = {}
      @configs = []

      configs.each do |cfg|
        add_config(cfg)
      end
    end

    def add_config(*objects)
      [*objects].each do |config|
        logger.debug "Adding: #{config.name}"
        @configs << config
        @values.merge!(config.values)
      end
    end

    def save(config)
      unless config.kind_of?(UberConfig::File)
        config = @configs.select{|x| x.name == config}.first
      end

      if config.writable?
        config.save(values) 
      else
        logger.warn "Config file #{config.path} not writable, cannot save"
      end
    end
  end
end
