require 'nokogiri'

module WeatherApi
  class TodaysWeather
    attr_accessor :condition, :temperature, :humidity, :icon, :wind_conditon

    def self.client
      WeatherApi::Client.new
    end

    def initialize(attributes)
      self.condition     = attributes['condition'].first
      self.temperature   = attributes['temp_f'].first
      self.humidity      = attributes['humidity'].first
      self.icon          = attributes['icon'].first
      self.wind_conditon = attributes['wind_condition'].first
    end

    def self.current_weather(location)
      attributes_hash = Hash.new
      response = Nokogiri::HTML(client.get_weather(location))
      response.css('current_conditions').each do |stat|
        stat.children.each do |key|
          attributes_hash[key.name] = key.values { |value| value }
        end
      end
      TodaysWeather.new(attributes_hash)
    end
  end
end