module Yai
  module Commands
    class Command
      attr_reader :options, :ui, :config

      def initialize(ui)
        @ui = ui
        @options = ui.options
      end

      protected

      def client
        @client ||= Yai::Client.new(config).client
      end

      def config
        @config ||= Yai::Config.new(options)
      end
    end
  end
end
