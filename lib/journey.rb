class Journey
attr_accessor :start_station, :end_station

  def initialize(station = nil)
    @start_station = station
    @end_station = station
  end
end
