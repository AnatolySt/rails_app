class CreateCarriages < ActiveRecord::Migration[5.1]
  def change
    create_table :carriages do |t|
      t.string :number
      t.string :kind
      t.integer :top_seats, :bottom_seats, default: 0
    end
    add_belongs_to :carriages, :train
  end
end