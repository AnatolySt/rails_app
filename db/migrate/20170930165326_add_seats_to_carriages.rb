class AddSeatsToCarriages < ActiveRecord::Migration[5.1]
  def change
    add_column :carriages, :side_top_seats, :integer, default: 0
    add_column :carriages, :side_bottom_seats, :integer, default: 0
    add_column :carriages, :down_seats, :integer, default: 0
    add_column :carriages, :type, :string
    add_column :carriages, :position, :integer
  end
end
