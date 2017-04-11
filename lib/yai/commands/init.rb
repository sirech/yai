module Yai
  module Commands
    class Init < Command
      def execute
        ui.class.source_root(File.expand_path("../../templates", __FILE__))
        ui.destination_root = File.expand_path("~")
        ui.copy_file "config", Yai::Config::PATH
        ui.info "Yai config file created (#{Yai::VERSION})"
      end
    end
  end
end
