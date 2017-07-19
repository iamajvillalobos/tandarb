require "spec_helper"

RSpec.describe Tandarb::Datastream do
  describe "POST create datastream" do
    token = ENV['TEST_API_TOKEN']

    it "creates a new datastream" do
      VCR.use_cassette("create_datastream", record: :once) do
        body = {
          "name": "Josh's Cafe",
          "source": "clover",
          "data_interval": 900,
          "print_mode": "values",
          "roster_display_mode": "values"
        }

        result = described_class.new(token).create(body)

        expect(result["name"]).to eq "Josh's Cafe"
      end
    end
  end
end