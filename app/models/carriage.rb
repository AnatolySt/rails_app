class Carriage < ApplicationRecord
  belongs_to :train

  scope :sorted, -> (sort_type) { order("number #{sort_type}") }

  validates :number, presence: true

  before_validation :set_position

  private

  def set_position
    if train.carriages.exists?
      last_num_tran = train.carriages.maximum('number')
      self.number = last_num_tran + 1
    else
      self.number = 1
    end
  end
end