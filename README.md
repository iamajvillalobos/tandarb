# Tandarb

This is a ruby wrapper for [Tanda API](https://my.tanda.co/api/v2/documentation).

## Installation

To install, just add `tandarb` to your Gemfile.

## Usage

Generate a token in your [My token](https://my.tanda.co/api/oauth/access_tokens) page.

### Users
```ruby
# Fetch all users
user_client = Tandarb::User.new(token)
users = user_client.all

# Create new user
user_client = Tandarb::User.new(token)
user = user_client.create(body)
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/iamarmanjon/tandarb. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Tandarb project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/tandarb/blob/master/CODE_OF_CONDUCT.md).
