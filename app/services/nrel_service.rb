# https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=80203&api_key=ENV["NREL_KEY"]&radius=6
class NrelService
  def initialize
    @conn = Faraday.new("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json")
  end

  def get_by_zipcode(zipcode)
    response = @conn.get("?location=80203&api_key=#{ENV['NREL_KEY']}&radius=6&fuel_type=ELEC, LPG")
    parse(response.body)["fuel_stations"].take(10)
  end

  private
    def parse(response)
      JSON.parse(response)
    end
end
