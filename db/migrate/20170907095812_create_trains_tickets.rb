class CreateTrainsTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :trains_tickets do |t|
      t.integer :train_id
      t.integer :ticket_id
    end
  end
end
