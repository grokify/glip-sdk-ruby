module Glip::SDK
  class Client
    attr_accessor :api
    attr_accessor :groups

    def initialize(rc_client)
      @api = rc_client
    end

    def load_groups
      res = @api.http.get 'glip/groups'
      @groups = Glip::SDK::Cache::Groups.new
      @groups.load_groups(res.body['records'])
    end

    def post_message(opts = {})
      unless opts.key? :text
        fail "Text must be provided to post message"
      end

      unless opts.key?(:group_id) || opts.key?(:group_name)
        fail "Group Id or Group Name must be provided"
      end

      group_id = (opts.key?(:group_name) && !opts.key?(:group_id)) \
        ? @groups.groups_name2id[opts[:group_name]] : opts[:group_id]

      @api.http.post do |req|
        req.url 'glip/posts'
        req.headers['Content-Type'] = 'application/json'
        req.body = { groupId: group_id, text: opts[:text] }
      end
    end

    def observe(observer)
      @subscription = @api.create_subscription()
      @subscription.subscribe([
        "/restapi/v1.0/account/~/extension/~/glip/posts"
      ])
      @subscription.add_observer observer
    end
  end
end
