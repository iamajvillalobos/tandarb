module Tandarb
  class Client
    BASE_URL = "https://my.tanda.co/api/v2/"

    def initialize(api_token)
      @api_token = api_token
    end

    def get(path:, token:)
      HTTParty.get(BASE_URL + path, :headers => headers(token)).parsed_response
    end

    def post(path:, body:, token:)
      HTTParty.post(BASE_URL + path, :headers => headers(token), :query => body)
    end

    def put(path:, body:, token:)
      HTTParty.put(BASE_URL + path, :headers => headers(token), :query => body)
    end

    def delete(path:, token:)
      HTTParty.delete(BASE_URL + path, :headers => headers(token))
    end

    private

    def headers(token)
      auth = "Bearer " + token
      {"Cache-Control"=> "no-cache", "Authorization"=> auth}
    end
  end
end
