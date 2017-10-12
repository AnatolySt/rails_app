class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  scope :sorted, -> { joins(:railway_stations_routes).order('railway_stations_routes.position ASC').uniq }

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(position: position) if station_route
  end

  def update_time(route, arr_time, dep_time)
    station_route = station_route(route)
    station_route.update(arrival_time: arr_time, departure_time: dep_time) if station_route
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  def arr_time_in(route)
    station_route(route).try(:arrival_time)
  end

  def dep_time_in(route)
    station_route(route).try(:departure_time)
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end