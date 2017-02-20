class Journey
attr_accessor :entry_station, :exit_station, :entry_zone, :exit_zone

  def initialize
    @entry_station = nil
    @exit_station = nil
    @entry_zone = 0
    @exit_zone = 0
  end
end
