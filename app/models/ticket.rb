class Ticket < ApplicationRecord
  belongs_to :train

  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :last_station, class_name: 'RailwayStation', foreign_key: :last_station_id

  def departure_time
    self.start_station.dep_time_in(train.route)
  end

  def arrival_time
    self.start_station.arr_time_in(train.route)
  end
end