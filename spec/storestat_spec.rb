require 'spec_helper'

RSpec.describe Tandarb::Storestat do
  describe "POST create storestat" do
    let(:token) { ENV['TEST_API_TOKEN'] }
    let(:datastream) {
      {
        "id"=>69355,
        "name"=>"Josh's Cafe",
        "source"=>"api",
        "data_interval"=>900,
        "enabled"=>true,
        "print_mode"=>"values",
        "roster_display_mode"=>"values",
        "updated_at"=>1500424435
      }
    }

    describe "single store stat" do
      it "creates a new store stat" do
        VCR.use_cassette("create_storestat", record: :all) do
          body = {
            "time": 1499190300,
            "stat": 35.50,
            "type": "sales"
          }

          result = described_class.new(token).create(body, datastream["id"])

          expect(result["stat"]).to eq 35.50
        end

      end
    end

    describe "multiple store stats" do
      it "creates new store stats" do
        VCR.use_cassette("create_many_storestats", record: :all) do
          body = {
            "stats": [
              {
                "time": 1499276700,
                "stat": 35.50,
                "type": "sales"
              },
              {
                "time": 1499277000,
                "stat": 75.00,
                "type": "sales"
              }
            ]
          }

          result = described_class.new(token).create(body, datastream["id"])

          expect(result.count).to eq 2
          expect(result.last["stat"]).to eq 75.00
        end
      end
    end
  end
end