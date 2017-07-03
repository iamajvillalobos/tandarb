require "spec_helper"

RSpec.describe Tandarb::User do
  describe "GET all users" do
    VCR.use_cassette("get_all_users", record: :once) do
      token = ENV['TEST_API_TOKEN']
      users = described_class.new(token).all

      it "should get all available users" do
        expect(users).to be_an_instance_of Array
      end
    end
  end

  describe "POST create user" do
    token = ENV['TEST_API_TOKEN']

    it "should create a new user" do
      VCR.use_cassette("create_user", record: :once) do
        body = { name: "Acer Natsumi" }
        user = described_class.new(token).create(body)
        expect(user["name"]).to eq "Acer Natsumi"
      end
    end
  end
end
