require 'httparty'

module AirVisualApi
  class Client
    BASE_URI = 'http://api.airvisual.com/v2'

    def initialize(api_key: ENV['AIRVISUAL_API_KEY'])
      # defaults to env variable but can be specified
      @api_key = api_key
    end

    def get(url:)
      HTTParty.get(BASE_URI + url + key_param)
    end

  private

    attr_reader :api_key

    def key_param
      "&key=#{api_key}"
    end
  end
end
