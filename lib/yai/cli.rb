require 'yai/commands'

module Yai
  class CLI < Thor
    include Thor::Actions
    include Yai::Utils::UI

    map %w(--version -v) => :version

    class_option :access_token,
                 type: :string,
                 default: nil,
                 aliases: %w[-t],
                 desc: 'Access Token for Github'

    class_option :api,
                 type: :string,
                 default: nil,
                 desc: 'URL of the Github API'

    class_option :organization,
                 type: :string,
                 default: nil,
                 desc: 'Name of the organization'

    class_option :repo,
                 type: :string,
                 default: nil,
                 desc: 'Name of the repository'

    class_option :team,
                 type: :string,
                 default: nil,
                 desc: 'The team to choose who can be assigned'

    desc 'version', 'Current version'
    def version
      Yai::Commands::Version.new(self).execute
    end

    desc 'init', 'Create configuration file'
    def init
      Yai::Commands::Init.new(self).execute
    end

    desc 'members', 'Current team members'
    def members
      Yai::Commands::Members.new(self).execute
    end

    desc 'issue', 'Find issue ISSUE'
    def issue(issue)
      Yai::Commands::Issue.new(self).execute(issue)
    end

    desc 'draw', 'Randomly assign ISSUE'
    def draw(issue)
      Yai::Commands::Draw.new(self).execute(issue)
    end

    desc 'redraw', 'Randomly reassign ISSUE'
    def redraw(issue)
      Yai::Commands::Redraw.new(self).execute(issue)
    end
  end
end
