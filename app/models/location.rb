class Location < ActiveRecord::Base

  #has_and_belongs_to_many :legs
  has_many :waypoints
  has_many :legs, :through => :waypoints
  
  #attr_accessible :address, :latitude, :longitude
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  
end
