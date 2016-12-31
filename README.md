Glip SDK for Ruby
=================

Glip SDK for Glip collaboration (https://glip.com).

## Usage

```ruby
rc_sdk = RingCentralSdk::REST::Client.new [...]
glip = GlipSdk::REST::Client.new rc_sdk
res = glip.posts.post group_id: '12345', text: 'Hi there!'
```

## Example Scripts

Example scripts can be found in the `scripts` directory.
