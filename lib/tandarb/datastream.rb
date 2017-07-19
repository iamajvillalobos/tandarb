module Tandarb
  class Datastream < Client
    def initialize(token)
      @token = token
    end

    def create(body)
      post('/datastreams', body, @token)
    end
  end
end