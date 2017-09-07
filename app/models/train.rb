class Train < ApplicationRecord
  belongs_to :route
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id

  has_many :trains_tickets
  has_many :tickets, through: :trains_tickets
end