module Yai
  class LuckyOne
    attr_reader :client, :team, :excluded, :location

    def initialize(client, team:, excluded:, location:)
      @client = client
      @team = team
      @excluded = Array(excluded)
      @location = location
    end

    def choose
      members, assignees, reporters = prepare_lists
      members = LeastAssignedMembers.new(members, assignees).list
      OpenIssuesWeighter.new(members, reporters).choose
    end

    private

    def issues
      @issues ||= client.list_issues(location.full_path, status: 'open')
    end

    def prepare_lists
      members = team.members
      assignees = list_to_people(:assignee)
      reporters = list_to_people(:user)

      [members, assignees, reporters].tap do |l|
        l.each do |sublist|
          excluded.each do |user|
            sublist.delete(user)
          end
        end
      end
    end

    def list_to_people(key)
      issues.map { |e| e.send(key) }.compact.map(&:login)
    end
  end

  class LeastAssignedMembers
    attr_reader :members, :assignees

    def initialize(members, assignees)
      @members = members
      @assignees = assignees
    end

    def list
      h = initial_hash
      count_assigned(h)
      l = group_by_assigned_count(h)
      l = sort_by_assigned_count(l)
      _, least_assigned = l.first
      least_assigned
    end

    private

    def initial_hash
      Hash[members.map { |member| [member, 0] }]
    end

    def count_assigned(h)
      assignees.each { |assignee| h[assignee] += 1 }
    end

    def group_by_assigned_count(h)
      h.group_by { |_, v| v }
    end

    def sort_by_assigned_count(l)
      l.sort.map { |freq, sublist| [freq, sublist.map(&:first)] }
    end
  end

  class OpenIssuesWeighter
    attr_reader :members, :reporters

    def initialize(members, reporters)
      @members = members
      @reporters = reporters & members # Count only members
    end

    def choose
      # The more reported issues, the likelier it becomes to be chosen
      (members + reporters).sample
    end
  end
end
