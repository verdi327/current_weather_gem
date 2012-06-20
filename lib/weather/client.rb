require 'faraday'
require 'nokogiri'

module WeatherApi
  class Client
    BASE_URL = 'http://www.google.com'

    def initialize
      @connection = Faraday.new(BASE_URL)
    end

    def get_weather(location)
      response = @connection.get do |req|
        req.url '/ig/api'
        req.headers['Accept'] = 'application/xml'
        req.params['weather'] = location
      end
      response.body
    end
  end
end