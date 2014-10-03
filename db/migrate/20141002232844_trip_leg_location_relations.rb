class TripLegLocationRelations < ActiveRecord::Migration
  def change
    add_column :legs, :trip_id, :integer
    #add_column :locations, :leg_id, :integer
  end
end
