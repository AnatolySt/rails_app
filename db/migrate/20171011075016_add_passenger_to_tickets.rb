class AddPassengerToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :full_name, :string
    add_column :tickets, :passport_num, :string
    remove_column :tickets, :number, :string
  end
end
