# who_delegated
This gem is a simple tool to help you find out if a method is delegated or not. My use case for it is when creating SQL queries, I want to find out whether the method is a delegated one, as we have some special logic for those cases.

## Usage
The gem adds the method 'delegated?' to the ActiveRecord::Base. You can use it like this:

```ruby
class User < ApplicationRecord
  has_one :friend
  delegate :name, to: :friend
end

User.new.delegated?(:name)
# => true
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem "who_delegated"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install who_delegated
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
