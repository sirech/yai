module Yai
  class Team
    attr_reader :client, :organization, :team_name

    def initialize(client, organization, team)
      @client = client
      @organization = organization
      @team_name = team
    end

    def members
      client.team_members(team.id).map(&:login)
    end

    private

    def team
      client.organization_teams(organization).find { |t| t.slug == team_name }
    end
  end
end
