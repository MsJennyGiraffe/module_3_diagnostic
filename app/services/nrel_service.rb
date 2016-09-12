# https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=80203&api_key=ENV["NREL_KEY"]&radius=6
class NrelService
  def initialize

  end

  def get_by_zipcode(zipcode)
    conn = Faraday.new("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json")
    response = conn.get("?location=80203&api_key=ENV['NREL_KEY']&radius=6")
    JSON.parse(response.body)
  end
end
