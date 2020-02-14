class WeatherController < ApplicationController

    def test

        response = RestClient.get("https://www.metaweather.com/api/location/search/?query=san")

        render json: response
    end

end
