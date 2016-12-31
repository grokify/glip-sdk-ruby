module GlipSdk
  # REST is the namespace for the RingCentral REST API class in the
  # RingCentral Ruby SDK
  module REST
    autoload :Cache, 'glip_sdk/rest/cache'
    autoload :Client, 'glip_sdk/rest/client'
    autoload :Groups, 'glip_sdk/rest/groups'
    autoload :Persons, 'glip_sdk/rest/persons'
    autoload :Posts, 'glip_sdk/rest/posts'
  end
end
