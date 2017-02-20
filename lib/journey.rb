class Journey
attr_accessor :entry_station, :exit_station

  def initialize(args)
    @entry_station = args[entry_station] = nil
    @exit_station = args[exit_station] = nil
    @entry_zone = args[entry_zone] = 0
    @exit_zone = args[exit_zone] = 0
  #   @entry_station = {station: station, entry_zone: = 0}
  #   @exit_station = {station: station, exit_zone: = 0}
  end
end
