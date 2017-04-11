module Yai
  module Commands
    class Draw < Command
      def execute(number)
        team = Yai::Team.new(client, config.organization, config.team)
        location = Yai::Location.new(organization: config.organization, repo: config.repo)
        issue = Yai::Issue.new(client, location: location, number: number)

        strategy = LuckyOne.new(client, team: team, excluded: issue.reporter, location: location)
        assigner = Yai::Assigner.new(client, team: team, issue: issue, strategy: strategy)

        success = assigner.assign

        if success
          ui.info "Issue[#{number}] => #{issue.title} was assigned to #{assigner.lucky_one}"
        else
          ui.error "Issue[#{number}] => #{issue.title} was not assigned to anybody, as it was already assigned"
        end
      end
    end
  end
end
