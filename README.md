# ActiveBuilder

ActiveBuilder is a simple gem to help you cleaning up your long arguments/params.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_builder'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_builder

## Usage

If you don't use builder pattern, maybe you will do like this when you working with long arguments.

```rb
class ParseDateTime
  def initialize(hours, minutes, seconds, day, month, year)
    @hours = hours
    @minutes = minutes
    @seconds = seconds
    @day = day
    @month = month
    @year = year
  end

  def to_s
    "Datetime: #{@hours}:#{@minutes}:#{@seconds} - #{@day} #{@month} #{@year}"
  end
end

ParseDateTime.new(10, 11, 12, 'Monday', 'November', 2019).to_s
# > "Datetime: 10:11:12 - Monday November 2019"
```

But if use builder pattern you can do like this.

```rb
class DateTimeBuilder
  include ActiveBuilder

  attributes :hours
  attributes :minutes
  attributes :seconds
  attributes :day
  attributes :month
  attributes :year
end

class ParseDateTime
  def initialize(date_time)
    @date_time = date_time
  end

  def to_s
    "Datetime: #{@date_time.hours}:#{@date_time.minutes}:#{@date_time.seconds} \
- #{@date_time.day} #{@date_time.month} #{@date_time.year}"
  end
end

date_time = DateTimeBuilder.new
                           .with_hours(10)
                           .with_minutes(50)
                           .with_seconds(12)
                           .with_day('Monday')
                           .with_month('December')
                           .with_year(2019)
ParseDateTime.new(date_time).to_s
# > "Datetime: 10:11:12 - Monday November 2019"
```

With builder pattern you don't worry with order position parameter again. Also it's more easy to modify and read.

You can read more about that in:

- https://drakeloud.com/blog/software-design-pattern-the-builder/

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/philiplambok/active_builder. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ActiveBuilder project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/active_builder/blob/master/CODE_OF_CONDUCT.md).
