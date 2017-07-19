module Tandarb
  class Storestat < Client
    def initialize(token)
      @token = token
    end

    def create(body, datastream_id)
      post("/storestats/for_datastream/#{datastream_id}", body, @token)
    end
  end
end