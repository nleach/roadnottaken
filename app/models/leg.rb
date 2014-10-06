class Leg < ActiveRecord::Base

  belongs_to :trip
  has_and_belongs_to_many :locations
  
  accepts_nested_attributes_for :locations

end
