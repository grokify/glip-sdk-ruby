require 'glip_sdk/rest'

module GlipSdk
  VERSION = '0.0.1'

  autoload :REST, 'glip_sdk/rest'

  class << self
    def new(client, opts = {})
      GlipSdk::REST::Client.new client, opts
    end
  end
end