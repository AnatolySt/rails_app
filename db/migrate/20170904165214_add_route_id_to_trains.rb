class AddRouteIdToTrains < ActiveRecord::Migration[5.1]
  def change
    # add_column :trains, :route_id, :integer
    add_belongs_to :trains, :route
  end
end
