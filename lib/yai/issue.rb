module Yai
  class Issue
    extend Forwardable

    def_delegators :issue, :title, :user, :assignee
    attr_reader :client, :location, :number, :issue

    def initialize(client, location:, number:)
      @client = client
      @location = location
      @number = number
    end

    def reporter
      user&.login
    end

    def reviewer
      assignee&.login
    end

    def reviewer?
      reviewer.present?
    end

    def assign(to)
      client.update_issue(location.full_path, number, assignee: to)
    end

    private

    def issue
      @issue ||= client.issue(location.full_path, number)
    end
  end
end
