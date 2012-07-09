# Weather

A dead freakin' simple weather gem.  No frills or side of guac included.  Use this gem to get the following information:
* Condition (i.e. 'partly cloudy')
* Temperature (Fahrenheit only - c'mon this is the USA we don't do the whole metric system thing)
* Humidity (percentage)
* Icon (.gif image that corresponds to the condition)
* Wind Condition (i.e. 'N at 9 mph')

## Installation

Add this line to your application's Gemfile:

    gem 'weather'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install weather

## Usage

Gem has only one class level method to interact with and returns an instance of the TodaysWeather class.
#### Example Call
WeatherApi::TodaysWeather.find('Chicago') #=> returns the following attributes
* condition
* temperature
* humidity
* icon
* wind_condition

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
