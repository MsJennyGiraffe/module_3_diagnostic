class Station
  attr_reader :name, :address, :distance, :fuel_type, :access_times
  def initialize(name, address, distance,fuel_type, access_times)
    @name = name
    @address = address
    @distance = distance
    @fuel_type = fuel_type
    @access_times = access_times
  end

  def self.all(zip)
    stations = NrelService.new.get_by_zipcode(zip)
    stations.map do |station|
      Station.new(
        station["station_name"],
        station["street_address"],
        station["distance"],
        station["fuel_type_code"],
        station["access_days_time"]
      )
    end
  end
end
