require 'httparty'

module AirVisualApi
  class Client
    BASE_URI = 'http://api.airvisual.com/v2'
    DEFAULT_HEADERS = {
      'Accept' => 'application/json',
      'Content-Type' => 'application/json'
    }.freeze

    def initialize(api_key: ENV['AIRVISUAL_API_KEY'])
      # defaults to env variable but can be specified
      @api_key = api_key
    end

    def get(url:, headers: {})
      HTTParty.get(BASE_URI + url + key_param(url), headers: headers.merge(DEFAULT_HEADERS))
    end

  private

    attr_reader :api_key

    def key_param(url)
      return "&key=#{api_key}" if url.include?('?')
      "?key=#{api_key}"
    end
  end
end
