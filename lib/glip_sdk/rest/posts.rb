require 'multi_json'

module GlipSdk
  module REST
    class Posts
      attr_accessor :groups_cache

      def initialize(rc_sdk)
        @api = rc_sdk
      end

      def post(opts = {})
        unless opts.key? :text
          raise ArgumentError, "Text must be provided to post message"
        end

        unless opts.key?(:groupId) || opts.key?(:groupName)
          raise ArgumentError, "Group Id or Group Name must be provided"
        end

        group_id = opts[:groupId]

        if group_id.nil? && @groups_cache && opts.key?(:groupName)
          group_id = @groups_cache.id_by_name(opts[:groupName])
        end

        params = { groupId: group_id, text: opts[:text] }
        puts MultiJson.encode params

        @api.http.post do |req|
          req.url 'glip/posts'
          req.headers['Content-Type'] = 'application/json'
          req.body = { groupId: group_id, text: opts[:text] }
        end
      end

      def get(opts = {})
        if opts.key? :postId
          return @api.http.get "glip/posts/#{opts[:postId]}"
        end
        @api.http.get do |req|
          req.url "glip/posts"
          req.headers['Content-Type'] = 'application/json'
          req.body = opts
        end
      end

      def observe(observer)
        @subscription = @api.create_subscription()
        @subscription.subscribe(['/restapi/v1.0/account/~/extension/~/glip/posts'])
        @subscription.add_observer observer
      end
    end
  end
end
