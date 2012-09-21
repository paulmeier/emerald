class MachineLoc < ActiveRecord::Base
  attr_accessible :id, :location_id, :machine_id, :raisedFloorLoc
  belongs_to :location
  belongs_to :machine

end
