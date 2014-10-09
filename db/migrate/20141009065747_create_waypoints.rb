class CreateWaypoints < ActiveRecord::Migration
  def change
    create_table :waypoints do |t|
      t.integer :leg_id
      t.integer :location_id
      t.integer :sort_flag

      t.timestamps
    end
  end
end
