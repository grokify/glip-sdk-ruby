Glip SDK for Ruby
=================

[![Gem Version][gem-version-svg]][gem-version-url]
[![Build Status][build-status-svg]][build-status-url]
[![Dependency Status][dependency-status-svg]][dependency-status-url]
[![Codacy Badge][codacy-svg]][codacy-url]
[![Code Climate][codeclimate-status-svg]][codeclimate-status-url]
[![Scrutinizer Code Quality][scrutinizer-status-svg]][scrutinizer-status-url]
[![Downloads][downloads-svg]][downloads-url]
[![Docs][docs-rubydoc-svg]][docs-rubydoc-url]
[![License][license-svg]][license-url]

[![Stack Overflow][stackoverflow-svg]][stackoverflow-url]
[![Chat][chat-svg]][chat-url]

Glip SDK for Glip collaboration (https://glip.com).

More documentation will be added soon. For now see the example and SDK code.

## Usage

```ruby
rc_sdk = RingCentralSdk::REST::Client.new [...]
glip = GlipSdk::REST::Client.new rc_sdk

# For HTTP calls, params are the same as REST API, e.g. camelCase
res = glip.posts.post groupId: '12345', text: 'Hi there!'

# All params can be provided:
groups = glip.groups.get                      # => Faraday::Response
groups = glip.groups.get groupId: 12345       # => Faraday::Response

# Get all groups will continue call `prevPageToken` as provided
groups = glip.groups.all_groups               # => Array group hash
groups = glip.groups.all_groups type: 'Group' # => ..where type == 'Group'
groups = glip.groups.all_groups type: 'Team'  # => ..where type == 'Team'

# Subscribe for updates
class MyObserver
  def update(message)
    puts 'received message'
  end
end

glip.groups.observe MyObserver.new
glip.posts.observe MyObserver.new
```

## Example Scripts

Example scripts can be found in the `scripts` directory.

### Change Log

See [CHANGELOG.md](CHANGELOG.md)

## Links

Project Repo

* https://github.com/ringcentral-ruby/glip-sdk-ruby

## Contributing

1. Fork it ( http://github.com/ringcentral-ruby/glip-sdk-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Glip SDK is available under the MIT license. See [LICENSE.md](LICENSE.md) for details.

Glip SDK &copy; 2016-2017 by John Wang

 [gem-version-svg]: https://badge.fury.io/rb/glip_sdk.svg
 [gem-version-url]: http://badge.fury.io/rb/glip_sdk
 [downloads-svg]: http://ruby-gem-downloads-badge.herokuapp.com/glip_sdk
 [downloads-url]: https://rubygems.org/gems/glip_sdk
 [build-status-svg]: https://api.travis-ci.org/ringcentral-ruby/glip-sdk-ruby.svg?branch=master
 [build-status-url]: https://travis-ci.org/ringcentral-ruby/glip-sdk-ruby
 [coverage-status-svg]: https://coveralls.io/repos/ringcentral-ruby/glip-sdk-ruby/badge.svg?branch=master
 [coverage-status-url]: https://coveralls.io/r/ringcentral-ruby/glip-sdk-ruby?branch=master
 [dependency-status-svg]: https://gemnasium.com/ringcentral-ruby/glip-sdk-ruby.svg
 [dependency-status-url]: https://gemnasium.com/ringcentral-ruby/glip-sdk-ruby
 [codacy-svg]: https://api.codacy.com/project/badge/Grade/eb469b5958d04fd188c37a999ac3620d
 [codacy-url]: https://www.codacy.com/app/ringcentral-ruby/glip-sdk-ruby
 [codeclimate-status-svg]: https://codeclimate.com/github/ringcentral-ruby/glip-sdk-ruby/badges/gpa.svg
 [codeclimate-status-url]: https://codeclimate.com/github/ringcentral-ruby/glip-sdk-ruby
 [scrutinizer-status-svg]: https://scrutinizer-ci.com/g/ringcentral-ruby/glip-sdk-ruby/badges/quality-score.png?b=master
 [scrutinizer-status-url]: https://scrutinizer-ci.com/g/ringcentral-ruby/glip-sdk-ruby/?branch=master
 [docs-rubydoc-svg]: https://img.shields.io/badge/docs-rubydoc-blue.svg
 [docs-rubydoc-url]: http://www.rubydoc.info/gems/glip_sdk/
 [license-svg]: https://img.shields.io/badge/license-MIT-blue.svg
 [license-url]: https://github.com/ringcentral-ruby/glip-sdk-ruby/blob/master/LICENSE.md
 [chat-svg]: https://img.shields.io/badge/chat-on%20glip-orange.svg
 [chat-url]: https://glipped.herokuapp.com/
 [stackoverflow-svg]: https://img.shields.io/badge/Stack%20Overflow-glip-orange.svg
 [stackoverflow-url]: https://stackoverflow.com/questions/tagged/glip
 
