module GlipSdk
  module REST
    class Posts
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

        group_id = (opts.key?(:groupName) && !opts.key?(:groupId)) \
          ? @groups.groups_name2id[opts[:groupName]] : opts[:groupId]

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
