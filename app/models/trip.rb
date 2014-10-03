class Trip < ActiveRecord::Base

  has_many :legs
  has_many :locations, through: :legs
  
  accepts_nested_attributes_for :legs

end
