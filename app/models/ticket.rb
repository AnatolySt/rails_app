class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :user

  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :last_station, class_name: 'RailwayStation', foreign_key: :last_station_id

  after_create :send_notification
  after_destroy :send_cancellation

  def departure_time
    self.start_station.dep_time_in(train.route)
  end

  def arrival_time
    self.start_station.arr_time_in(train.route)
  end

  def route_name
    "#{start_station.title} - #{last_station.title}"
  end

  private

  def send_notification
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def send_cancellation
    TicketsMailer.cancel_ticket(self.user, self).deliver_now
  end
end