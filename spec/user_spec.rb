require "spec_helper"

RSpec.describe Tandarb::User do
  describe "GET all users" do
    VCR.use_cassette("get_all_users") do
      token = "42e9e4ff45f0c10deac87b2437bd7f52c7fb04cb1e8470a16aafebe37fd9b30c"
      client = Tandarb::Client.new(token)
      users = described_class.new(client.api_token).all

      it "should get all available users" do
        expect(users).to be_an_instance_of Array
      end
    end
  end
end
