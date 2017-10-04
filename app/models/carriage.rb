class Carriage < ApplicationRecord
  belongs_to :train

  scope :sorted, -> (sort_type) { order("position #{sort_type}") }

  validates :number, presence: true

  before_validation :set_position

  private

  def set_position
    if train.carriages.exists?
      self.position = train.carriages.last.position + 1
    else
      self.position = 1
    end
  end
end