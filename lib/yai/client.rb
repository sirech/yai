module Yai
  class Client
    attr_reader :client

    def initialize(config)
      if config.api?
        Octokit.configure do |c|
          c.api_endpoint = config.api
        end
      end

      @client = Octokit::Client.new(access_token: token(config))
    end

    private

    def token(config)
      token = config.access_token
      raise ArgumentError, 'Missing access_token variable in configuration' unless token
      token
    end
  end
end
