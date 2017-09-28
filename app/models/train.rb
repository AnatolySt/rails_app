class Train < ApplicationRecord
  belongs_to :route
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id

  has_many :tickets
  has_many :carriages

  def count_carriages(kind)
    carriages_count = 0
    self.carriages.each do |carriage|
      if carriage.kind == kind
        carriages_count += 1
      end
    end
    return carriages_count
  end

  def count_seats(kind, seats_type)
    seats_count = 0
    self.carriages.each do |carriage|
      if carriage.kind == kind
        if seats_type == 'bottom_seats'
          seats_count += carriage.bottom_seats
        elsif seats_type == 'top_seats'
          seats_count += carriage.top_seats
        end
      end
    end
    return seats_count
  end
end