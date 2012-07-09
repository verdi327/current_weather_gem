require 'nokogiri'

module WeatherApi
  class TodaysWeather
    attr_accessor :condition, :temperature, :humidity, :icon, :wind_condition

    def initialize(attributes)
      self.condition      = attributes['condition'].first
      self.temperature    = attributes['temp_f'].first
      self.humidity       = attributes['humidity'].first
      self.icon           = "www.google.com" + attributes['icon'].first
      self.wind_condition = attributes['wind_condition'].first
    end

    def self.client
      WeatherApi::Client.new
    end

    def self.parse(xml_package)
      Nokogiri::HTML(xml_package)
    end

    def self.find(location)
      attributes_hash = Hash.new
      response = parse(client.get_weather(location))
      response.css('current_conditions').each do |stat|
        stat.children.each do |key|
          attributes_hash[key.name] = key.values { |value| value }
        end
      end
      TodaysWeather.new(attributes_hash)
    end
  end
end