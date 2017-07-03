require "spec_helper"

RSpec.describe Tandarb::Client do
  it "has proper base url" do
    expect(described_class::BASE_URL).to eq "https://my.tanda.co/api/v2"
  end
end
