class Journey
attr_accessor :entry_station, :exit_station

  def initialize(station = nil)
    @entry_station = station
    @exit_station = station
  end
end
