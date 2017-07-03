require "spec_helper"

RSpec.describe Tandarb::User do
  describe "GET all users" do
    VCR.use_cassette("get_all_users", record: :once) do
      token = "42e9e4ff45f0c10deac87b2437bd7f52c7fb04cb1e8470a16aafebe37fd9b30c"
      client = Tandarb::Client.new(token)
      users = described_class.new(client.api_token).all

      it "should get all available users" do
        expect(users).to be_an_instance_of Array
      end
    end
  end

  describe "POST create user" do
    token = "42e9e4ff45f0c10deac87b2437bd7f52c7fb04cb1e8470a16aafebe37fd9b30c"
    client = Tandarb::Client.new(token)

    it "should create a new user" do
      VCR.use_cassette("create_user", record: :once) do
        body = { name: "Acer Natsumi" }
        user = described_class.new(client.api_token).create(body)
        expect(user["name"]).to eq "Acer Natsumi"
      end
    end
  end
end
