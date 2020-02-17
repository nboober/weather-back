class WeatherController < ApplicationController

    def test

        # San Francisco
        response = RestClient.get("https://www.metaweather.com/api/location/2487956/")

        render json: response
        
    end

    def search

    # The Search feature only returns certian locations because the API is restricted to just a few locations
    query = params["term"]
    
    locate = RestClient.get("https://www.metaweather.com/api/location/search/?query=#{query}")
    jsonResponse = JSON.parse(locate.body)
    
    locationId = jsonResponse.first["woeid"]
    response = RestClient.get("https://www.metaweather.com/api/location/#{locationId}/")

    render json: response
    
    end

    def geolocation

        # The Search feature only returns certian locations because the API is restricted to just a few locations
        location = params["coordinates"]
        response = RestClient.get("https://www.metaweather.com/api/location/search/?lattlong=#{location}")
        jsonResponse = JSON.parse(response.body)
        locationId = jsonResponse.first["woeid"]

        response = RestClient.get("https://www.metaweather.com/api/location/#{locationId}/")

        render json: response 
    end

end
