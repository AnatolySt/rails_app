class AddRailwayStationIdToTrains < ActiveRecord::Migration[5.1]
  def change
    add_belongs_to :trains, :current_station, index: true
  end
end
