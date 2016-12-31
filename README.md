Glip SDK for Ruby
=================

## Usage

```ruby
api_client = RingCentralSdk::REST::Client.new [...]
glip = GlipSdk::REST::Client.new api_client
res = glip.posts.post group_id: '12345', text: 'Hi there!'
```

## Example Scripts

Example scripts can be found in the `scripts` directory.
