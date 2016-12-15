Glip SDK for Ruby
=================

```ruby
client = RingCentralSdk::REST::Client
glip = Glip::SDK::Client.new client
res = glip.post_message group_id: '12345', text: 'Hi there!'
```