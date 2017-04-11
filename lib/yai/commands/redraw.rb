module Yai
  module Commands
    class Redraw < Command
      def execute(number)
        team = Yai::Team.new(client, config.organization, config.team)
        location = Yai::Location.new(organization: config.organization, repo: config.repo)
        issue = Yai::Issue.new(client, location: location, number: number)

        previous = issue.reviewer

        strategy = LuckyOne.new(client, team: team, excluded: [issue.reporter, previous], location: location)
        assigner = Yai::Assigner.new(client, team: team, issue: issue, strategy: strategy)

        success = assigner.reassign

        if success
          ui.info "Issue[#{number}] => #{issue.title} was assigned to #{previous}, got reassigned to #{assigner.lucky_one}"
        else
          ui.error "Issue[#{number}] => #{issue.title} cannot be reassigned, as nobody is assigned to it yet"
        end
      end
    end
  end
end
