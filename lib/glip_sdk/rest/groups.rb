module GlipSdk
  module REST
    class Groups
      attr_accessor :subscription

      def initialize(rc_sdk)
        @api = rc_sdk
      end

      def get(opts = {})
        if opts.key? :groupId
          return @api.http.get "glip/groups/#{opts[:groupId]}"
        end
        @api.http.get 'glip/groups', opts
      end

      def observe(observer)
        @subscription = @api.create_subscription
        @subscription.subscribe ['/restapi/v1.0/account/~/extension/~/glip/groups']
        @subscription.add_observer observer
      end
    end
  end
end
