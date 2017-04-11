module Yai
  module Commands
    class Members < Command
      def execute
        members = Yai::Team.new(client, config.organization, config.team).members
        ui.info "Team members are:"
        members.each do |m|
          ui.info "\t- #{m}"
        end
      end
    end
  end
end
