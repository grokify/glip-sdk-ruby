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

# Get all groups and teams
groups = glip.groups.all_groups
glip.logger.info "#{groups.length} groups/teams were found."

# Get all groups
groups = glip.groups.all_groups type: 'Group'
glip.logger.info "#{groups.length} groups were found."

# Get all teams
teams = glip.groups.all_groups type: 'Team'
glip.logger.info "#{teams.length} teams were found."

# Get one team
if teams.length
  team = glip.groups.get groupId: teams[0]['id']
  glip.logger.info MultiJson.encode(team.body)
else
  glip.logger.info 'No teams to retrieve'
end

# Subscribe to group events including: GroupAdded, GroupChanged and GroupRemoved
class MyObserverGroups
  def initialize(logger)
    @logger = logger
  end

  def update(message)
    @logger.info 'Subscription Group Message Received'
    @logger.info MultiJson.encode(message)
  end
end

glip.groups.observe MyObserverGroups.new(glip.logger)

glip.logger.info("Hit any key to end")

gets

glip.groups.subscription.destroy
