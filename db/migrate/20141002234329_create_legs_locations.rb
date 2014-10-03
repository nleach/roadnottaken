class CreateLegsLocations < ActiveRecord::Migration
  def change
    create_table :legs_locations do |t|
      t.integer :leg_id
      t.integer :location_id

      t.timestamps
    end
  end
end
