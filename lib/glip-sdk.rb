require 'glip-sdk/cache'
require 'glip-sdk/client'

module Glip
  module SDK
    VERSION = '0.0.1'

    class << self
      def new(client, opts = {})
        Glip::SDK::Client.new client, opts
      end
    end
  end
end
