# YAI ( You Are It)

In this [Tag Game](https://en.wikipedia.org/wiki/Tag_(game)) you tag others so that they review your _Pull Requests_. What could be more fun than that?

This script _randomly_ assign an issue (or pull request) to a member of the team.

## Who is eligible?

Every member of the `team` defined in the configuration. Note that the team has to belong to the organization defined in the configuration.

## Setup

### Installation

Simply running

    gem install yai

will install the gem and make the `yai` executable available for you.

### Token

You need to setup an access token for github.

Tokens can be created in the settings, [which would be this one for github](https://www.github.com/settings/tokens) and should include the following scopes:

![Scopes](images/scopes.png)

### Configuration file

_YAI_ needs a configuration file to work. The easiest way to get one is to run

    yai init

The file will be in `~./yairc`. You need to put your token there.

## Usage

To see who are the members of the team that can be chosen

```
bin/yai members
```

To assign an issue for the first time

```
bin/yai draw pull_request_number
```

To reassign an issue, for example if the assigned guy is on vacation

```
bin/yai redraw pull_request_number
```
