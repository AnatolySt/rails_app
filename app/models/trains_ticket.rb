class TrainsTicket < ApplicationRecord
  belongs_to :train
  belongs_to :ticket
end