module GlipSdk
  module REST
    class Persons
      def initialize(rc_sdk)
        @api = rc_sdk
      end

      def get(opts = {})
        if opts.key? :personId
          return @api.http.get "glip/persons/#{opts[:personId]}"
        end
        nil
      end
    end
  end
end
