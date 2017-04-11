module Yai
  class Location
    def initialize(organization:, repo:)
      @organization = organization
      @repo = repo
    end

    def full_path
      "#{@organization}/#{@repo}"
    end
  end
end
