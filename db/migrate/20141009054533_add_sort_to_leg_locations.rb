class AddSortToLegLocations < ActiveRecord::Migration
  def change
    add_column :legs_locations, :sort_flag, :integer
  end
end
