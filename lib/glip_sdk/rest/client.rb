module GlipSdk
  module REST
    class Client
      attr_accessor :api
      attr_accessor :logger
      attr_accessor :groups
      attr_accessor :persons
      attr_accessor :posts

      def initialize(rc_sdk)
        @api = rc_sdk
        @logger = @api.config.logger
        @groups = GlipSdk::REST::Groups.new @api
        @persons = GlipSdk::REST::Persons.new @api
        @posts = GlipSdk::REST::Posts.new @api
      end

      def load_groups
        res = @groups.get.http.get 'glip/groups'
        @groups_cache = GlipSdk::REST::Cache::Groups.new
        @groups.load_groups(res.body['records'])
      end
    end
  end
end

=begin
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
=end
