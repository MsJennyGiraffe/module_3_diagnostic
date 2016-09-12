require 'rails_helper'

describe NrelService do
  context "get_by_zipcode" do
    it "returns a list stations by location" do
      VCR.use_cassette("stations") do
        locations = NrelService.new.get_by_zipcode(80203)
        location = location.first

        expect(location).to eq("")
      end
    end
  end
end
