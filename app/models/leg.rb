class Leg < ActiveRecord::Base

  belongs_to :trip
  
  #has_and_belongs_to_many :locations, -> { order "sort_flag ASC" }
  has_many :waypoints, :dependent => :destroy
  has_many :locations, -> { order "sort_flag ASC" }, :through => :waypoints
  
  accepts_nested_attributes_for :locations

end
