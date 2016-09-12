require 'rails_helper'

describe Station do
  context "all" do
    it "makes stations" do
      VCR.use_cassette("stations model") do
        stations = Station.all(80203)
        station = stations.first

        expect(stations.count).to eq(10)
        expect(station.name).to eq("UDR")
        expect(station.distance).to eq(0.3117)
        expect(station.address).to eq("800 Acoma St")
        expect(station.fuel_type).to eq("ELEC")
        expect(station.access_times).to eq("24 hours daily")
      end
    end
  end
end
