require 'httparty'

module AirVisualApi
  class Client
    include HTTParty
    base_uri 'api.airvisual.com/v2'

    def initialize(api_key: ENV['AIRVISUAL_API_KEY'])
      # defaults to env variable but can be specified
      @api_key = api_key
    end
  end
end
