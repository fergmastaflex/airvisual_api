module AirVisualApi
  class City
    # For MVP and prototyping, I'm just going to send back raw
    # HTTParty responses to the main app. Further iterations
    # will see better response parsing and humanizing
    # some of the key names. I can't stand abbreviation
    # and jargon.

    def nearest_city_by_gps(latitude:, longitude:)
      # coercing to float to ensure proper formatting
      # this should probably be a little smarter with some
      # regex checking coupled with some ruby errors, but
      # for time and prototyping sake I'm just going to coerce
      latitude = latitude.to_f
      longitude = longitude.to_f
      client.get(url: "/nearest_city?lat=#{latitude}&lon=#{longitude}")
    end

    # Only going to support American states for an MVP
    # Typical American exceptionalism, amirite? ;)
    def city_by_name_and_state(city:, state:)
      client.get(url: "/city?city=#{city}&state=#{state}&country=USA")
    end

  private

    def client
      @client ||= AirVisualApi::Client.new
    end
  end
end
