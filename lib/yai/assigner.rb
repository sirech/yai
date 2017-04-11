module Yai
  class Assigner
    attr_reader :client, :team, :issue, :strategy

    def initialize(client, team:, issue:, strategy:)
      @client = client
      @team = team
      @issue = issue
      @strategy = strategy
    end

    def lucky_one
      @dude ||= strategy.choose
    end

    def assign
      if issue.reviewer?
        false
      else
        issue.assign(lucky_one)
        true
      end
    end

    def reassign
      if issue.reviewer?
        issue.assign(lucky_one)
        true
      else
        false
      end
    end
  end
end
