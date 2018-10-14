class MachineConfig < ActiveRecord::Base
  attr_accessible :capacity_id, :cbu, :centralStorage, :crypto, :es, :fi, :icf, :id, :ifb, :machineLoc_id, :machine_id, :mod_id, :osa, :name, :ziip
  
  belongs_to :machine 
  belongs_to :capacity
  belongs_to :mod

  validates :machine_id, :uniqueness => true
  
  def self.msuPerEngine(id)
    @Machine = Machine.find(id)
    (@Machine.machineConfig.capacity.mips.to_f / @Machine.machineConfig.capacity.msu.to_f).round(2)
  end
  
  def self.machineCpPerShare(id)
    @Machine = Machine.find(id)
    (@Machine.machineConfig.capacity.mips / (@Machine.machineConfig.capacity.capSetting % 100))
  end
  
  def self.remainingStorage(id)
    @Machine = Machine.find(id)
    @Machine.machineConfig.centralStorage - (LparConfig.sum(:storageNormal) + 16000)
  end
end
