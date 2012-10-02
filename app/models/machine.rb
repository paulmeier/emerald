class Machine < ActiveRecord::Base
  attr_accessible :id, :name, :serialNumber
  
  has_one :machineConfig, dependent: :destroy
  has_many :machine_lpars, dependent: :destroy
  has_many :lpars, through: :machine_lpars
  has_many :machine_locs, dependent: :destroy
  has_many :locations, through: :machine_locs
  
  validates :name, presence: true, length: { minimum: 1, maximum: 10 }, uniqueness: true
  validates :serialNumber, presence: true, length: { minimum: 1, maximum: 10}, uniqueness: true
  
  def self.verifyMachineConfigsExist()
    @machines = Machine.all
    @machines.each do |machine|
      if (machine.machineConfig.nil?)
        if !(Notification.exists?(name: "error", msg: machine.name + " does not have a Machine Configuration."))
          Notification.create(name: "error", msg: machine.name + " does not have a Machine Configuration.")
        end
      end
    end
  end
  
end
