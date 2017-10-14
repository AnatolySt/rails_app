class Search < ApplicationRecord
  def self.find_train(dep_station, arr_station)
    return false if dep_station == arr_station
    check_train(dep_station) & check_train(arr_station)
  end

  def self.check_train(station_id)
    Train.joins(route: :railway_stations).where(railway_stations: { id: station_id })
  end
end