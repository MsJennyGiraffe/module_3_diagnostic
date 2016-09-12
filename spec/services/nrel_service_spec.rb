require 'rails_helper'

describe NrelService do
  context "get_by_zipcode" do
    it "returns a list stations by location" do
      VCR.use_cassette("stations") do
        locations = NrelService.new.get_by_zipcode(80203)
        location = locations.first

        expect(location["station_name"]).to eq("UDR")
        expect(location["street_address"]).to eq("800 Acoma St")
        expect(location["fuel_type_code"]).to eq("ELEC")
        expect(location["distance"]).to eq(0.3117)
        expect(location["access_days_time"]).to eq("24 hours daily")
      end
    end
  end
end
