module Yai
  module Commands
    class Version < Command
      def execute
        ui.info "Yai Scripts (#{Yai::VERSION})"
      end
    end
  end
end
