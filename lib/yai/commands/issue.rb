module Yai
  module Commands
    class Issue < Command
      def execute(number)
        location = Yai::Location.new(organization: config.organization, repo: config.repo)
        issue = Yai::Issue.new(client, location: location, number: number)
        ui.info "Issue[#{number}] => #{issue.title}"
      end
    end
  end
end
