class Waypoint < ActiveRecord::Base

  belongs_to :leg
  belongs_to :location

  def initialize(attributes={})
    super
    @sort_flag ||= 0
  end
  
end
