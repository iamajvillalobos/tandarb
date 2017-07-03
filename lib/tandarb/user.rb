module Tandarb
  class User < Client
    def initialize(token)
      @token = token
    end

    def all
      get('/users', @token)
    end
  end
end
