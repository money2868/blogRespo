require 'delegate'

module Enki
  class Config < SimpleDelegator
    def initialize(file_name)
      super(symbolize_keys(YAML::load(IO.read(file_name))))
    end

    def [](*path)
      path.inject(__getobj__()){|config,item|
	config[item]
      }
    end

    def self.default
      Enki::Config.new(default_location)
    end

    def self.default_location
      "#{Rails.root}/config/site.yml"
    end
   end
end
