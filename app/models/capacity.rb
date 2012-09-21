class Capacity < ActiveRecord::Base
  attr_accessible :capSetting, :id, :mips, :msu, :name, :number
  has_one :machineConfig
end
