require 'multi_json'

require 'glip_sdk/rest/cache/groups'

module GlipSdk
  module REST
    class Client
      attr_accessor :api
      attr_accessor :logger
      attr_accessor :groups
      attr_accessor :groups_cache
      attr_accessor :persons
      attr_accessor :posts

      def initialize(rc_sdk)
        @api = rc_sdk
        @logger = @api.config.logger
        puts ">>>\nGLIP_SCK_LOGGER_NAME [#{@api.config.logger.class.name}]\n<<<\n"

        @groups_cache = GlipSdk::REST::Cache::Groups.new

        @groups = GlipSdk::REST::Groups.new @api
        @persons = GlipSdk::REST::Persons.new @api
        @posts = GlipSdk::REST::Posts.new @api
      end

      def load_groups_cache(filepath = nil)
        if !filepath.nil? && File.exist?(filepath)
          groups_json = IO.read filepath
          all_groups = MultiJson.decode groups_json
          @groups_cache.load_groups all_groups
        else
          @groups_cache.load_groups @groups.all_groups          
        end

        @posts.groups_cache = @groups_cache
      end
    end
  end
end
