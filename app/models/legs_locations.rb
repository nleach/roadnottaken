class LegsLocations < ActiveRecord::Base

  belongs_to :leg
  belongs_to :location

end
