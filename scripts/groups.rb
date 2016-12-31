#!ruby

require 'dotenv'
require 'logger'
require 'multi_json'
require 'ringcentral_sdk'
require 'glip_sdk'

Dotenv.load

rc = RingCentralSdk::REST::Client.new do |config|
  config.server_url = RingCentralSdk::RC_SERVER_PRODUCTION
  config.app_key = ENV['RC_APP_KEY']
  config.app_secret = ENV['RC_APP_SECRET']

  config.username = ENV['RC_USER_USERNAME']
  config.extension = ENV['RC_USER_EXTENSION']
  config.password = ENV['RC_USER_PASSWORD']

  config.logger = Logger.new STDOUT
  config.logger.level = Logger::INFO
end

glip = GlipSdk::REST::Client.new rc

def all_groups(glip, params = {})
  groups = []
  get_next = true
  while get_next == true
    res = glip.groups.get params
    groups.concat(res.body['records']) if res.body['records'].length > 0

    if res.body.key?('navigation') && res.body['navigation'].key?('prevPageToken')
      params['pageToken'] = res.body['navigation']['prevPageToken']
      glip.logger.info "PrevPageToken [#{res.body['navigation']['prevPageToken']}]"
    else
      get_next = false
    end
  end
  return groups
end

# Get all groups and teams
groups = all_groups glip
glip.logger.info "#{groups.length} groups/teams were found."

# Get all groups
groups = all_groups glip, type: 'Group'
glip.logger.info "#{groups.length} groups were found."

# Get all teams
teams = all_groups glip, type: 'Team'
glip.logger.info "#{teams.length} teams were found."

# Get one team
if teams.length
  team = glip.groups.get groupId: teams[0]['id']
  glip.logger.info MultiJson.encode(team.body)
else
  glip.logger.info 'No teams to retrieve'
end

# Subscribe to group events including: GroupAdded, GroupChanged and GroupRemoved
class MyObserver
  def initialize(logger)
    @logger = logger
  end

  def update(message)
    @logger.info 'Subscription Message Received'
    @logger.info MultiJson.encode(message)
  end
end

glip.groups.observe MyObserver.new(glip.logger)

glip.logger.info("Hit any key to end")

gets

glip.groups.subscription.destroy
