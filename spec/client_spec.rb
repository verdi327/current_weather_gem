require 'spec_helper'

describe WeatherApi::Client do
  describe "#get_weather" do
    it 'returns an xml response' do
      WeatherApi::Client.new.get_weather("Chicago").should include 'xml'
    end
  end
end