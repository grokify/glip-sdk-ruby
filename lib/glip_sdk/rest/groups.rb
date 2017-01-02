module GlipSdk
  module REST
    class Groups
      attr_accessor :cache
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

      def all_groups(params = {})
        groups = []
        get_next = true
        while get_next == true
          res = get params
          groups.concat(res.body['records']) if res.body['records'].length > 0

          if res.body.key?('navigation') && res.body['navigation'].key?('prevPageToken')
            params['pageToken'] = res.body['navigation']['prevPageToken']
            @api.config.logger.info "PrevPageToken [#{res.body['navigation']['prevPageToken']}]"
          else
            get_next = false
          end
        end
        return groups
      end
    end
  end
end
