Glip SDK for Ruby
=================

[![Gem Version][gem-version-svg]][gem-version-link]
[![Build Status][build-status-svg]][build-status-link]
[![Dependency Status][dependency-status-svg]][dependency-status-link]
[![Codacy Badge][codacy-svg]][codacy-link]
[![Code Climate][codeclimate-status-svg]][codeclimate-status-link]
[![Scrutinizer Code Quality][scrutinizer-status-svg]][scrutinizer-status-link]
[![Downloads][downloads-svg]][downloads-link]
[![Docs][docs-rubydoc-svg]][docs-rubydoc-link]
[![License][license-svg]][license-link]

Glip SDK for Glip collaboration (https://glip.com).

More documentation will be added soon. For now see the example and SDK code.

## Usage

```ruby
rc_sdk = RingCentralSdk::REST::Client.new [...]
glip = GlipSdk::REST::Client.new rc_sdk
res = glip.posts.post group_id: '12345', text: 'Hi there!'
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

Glip SDK &copy; 2016 by John Wang

 [gem-version-svg]: https://badge.fury.io/rb/glip_sdk.svg
 [gem-version-link]: http://badge.fury.io/rb/glip_sdk
 [downloads-svg]: http://ruby-gem-downloads-badge.herokuapp.com/glip_sdk
 [downloads-link]: https://rubygems.org/gems/glip_sdk
 [build-status-svg]: https://api.travis-ci.org/ringcentral-ruby/glip-sdk-ruby.svg?branch=master
 [build-status-link]: https://travis-ci.org/ringcentral-ruby/glip-sdk-ruby
 [coverage-status-svg]: https://coveralls.io/repos/ringcentral-ruby/glip-sdk-ruby/badge.svg?branch=master
 [coverage-status-link]: https://coveralls.io/r/ringcentral-ruby/glip-sdk-ruby?branch=master
 [dependency-status-svg]: https://gemnasium.com/ringcentral-ruby/glip-sdk-ruby.svg
 [dependency-status-link]: https://gemnasium.com/ringcentral-ruby/glip-sdk-ruby
 [codacy-svg]: https://api.codacy.com/project/badge/Grade/eb469b5958d04fd188c37a999ac3620d
 [codacy-link]: https://www.codacy.com/app/ringcentral-ruby/glip-sdk-ruby
 [codeclimate-status-svg]: https://codeclimate.com/github/ringcentral-ruby/glip-sdk-ruby/badges/gpa.svg
 [codeclimate-status-link]: https://codeclimate.com/github/ringcentral-ruby/glip-sdk-ruby
 [scrutinizer-status-svg]: https://scrutinizer-ci.com/g/ringcentral-ruby/glip-sdk-ruby/badges/quality-score.png?b=master
 [scrutinizer-status-link]: https://scrutinizer-ci.com/g/ringcentral-ruby/glip-sdk-ruby/?branch=master
 [docs-readthedocs-svg]: https://img.shields.io/badge/docs-readthedocs-blue.svg
 [docs-rubydoc-link]: http://www.rubydoc.info/gems/ringcentral_sdk/
 [license-svg]: https://img.shields.io/badge/license-MIT-blue.svg
 [license-link]: https://github.com/ringcentral-ruby/glip-sdk-ruby/blob/master/LICENSE.md
