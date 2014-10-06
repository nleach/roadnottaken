class Location < ActiveRecord::Base

  has_and_belongs_to_many :legs
  
  #attr_accessible :address, :latitude, :longitude
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  
end
