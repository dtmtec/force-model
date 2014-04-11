# Force::Model

Integrate with salesforce by declaring your models.

## Installation

Add this line to your application's Gemfile:

    gem 'force-model'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install force-model

## Usage

```ruby
class MyCustomObject
  include Force::Model

  field :name, type: String
end
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/force-model/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
