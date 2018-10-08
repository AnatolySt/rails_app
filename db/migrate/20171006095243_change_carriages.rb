class ChangeCarriages < ActiveRecord::Migration[5.1]
  def change
    remove_column :carriages, :position, :integer
    change_column :carriages, :number, 'numeric USING CAST(number AS numeric)'
  end
end
