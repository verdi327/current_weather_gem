require 'spec_helper'

describe WeatherApi::TodaysWeather do
  let(:sample_response) { File.open("spec/fixtures/sample_chicago_response.xml") }

  before(:each) do
    WeatherApi::TodaysWeather.stub(:parse).and_return(Nokogiri::HTML(sample_response))
  end

  describe ".find(location)" do
    it "returns an instance of WeatherApi::TodaysWeather" do
      WeatherApi::TodaysWeather.find('Chicago').should be_a(WeatherApi::TodaysWeather)
    end

    context "verifying the data was set correctly" do
      it 'returns a valid temperature' do
        WeatherApi::TodaysWeather.find("Chicago").temperature.should == "75"
      end
    end
  end
end