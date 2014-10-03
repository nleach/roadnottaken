class Leg < ActiveRecord::Base

  belongs_to :trip
  has_many :locations, through: :legs_locations
  
  accepts_nested_attributes_for :locations

end
