module Tandarb
  class Oauth < Client
    BASE_URL = 'https://my.tanda.co/api/v2/oauth'.freeze
    TOKEN_URL = "#{BASE_URL}/token".freeze

    def self.authorize(scope, client_id, redirect_uri)
      url = "#{BASE_URL}/authorize?scope=#{scope}&client_id=#{client_id}"
      url += "&response_type=code&redirect_uri=#{redirect_uri}"

      HTTParty.get(url).parsed_response
    end

    def self.request_token(code: code, client_id: client_id, client_secret: client_secret, redirect_uri: redirect_uri)
      body = {
        code: code,
        client_id: client_id,
        client_secret: client_secret,
        redirect_uri: redirect_uri,
        grant_type: 'authorization_code'
      }

      HTTParty.post(TOKEN_URL, body: body).parsed_response
    end

    def self.refresh_token(client_id, client_secret, refresh_token, redirect_uri)
      body = {
        client_id: client_id,
        client_secret: client_secret,
        refresh_token: refresh_token,
        redirect_uri: redirect_uri,
        grant_type: 'refresh_token'
      }

      HTTParty.post(TOKEN_URL, body: body).parsed_response
    end
  end
end
