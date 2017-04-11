module Yai
  class Config
    PATH = '~/.yairc'.freeze

    attr_reader :config

    def initialize(options = {})
      options = options.symbolize_keys
      path = File.expand_path(default_config_path)
      @config = config_from_file(path).merge(options)
    end

    def method_missing(name, *args)
      name = name.to_sym

      if name =~ /(.*)\?$/
        key = $1
        config.key?(key.to_sym)
      elsif config.key?(name)
        config[name]
      else
        super
      end
    end

    def respond_to_missing?(name)
      name = /(.*?)[?]?$/.match(name)[1].to_sym # Remove ? if present
      return true if config.key?(name)
      super
    end

    private

    def config_from_file(path)
      YAML.load_file(path).symbolize_keys
    rescue Errno::ENOENT
      {}
    end

    def default_config_path
      PATH
    end
  end
end
