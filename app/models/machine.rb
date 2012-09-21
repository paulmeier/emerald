class Machine < ActiveRecord::Base
  attr_accessible :id, :name, :serialNumber
  
  has_one :machineConfig, dependent: :destroy
  has_many :machine_lpars
  has_many :lpars, through: :machine_lpars
  has_many :machine_locs
  has_many :locations, through: :machine_locs
  
  validates :name, presence: true, length: { minimum: 1, maximum: 10 }, uniqueness: true
  validates :serialNumber, presence: true, length: { minimum: 1, maximum: 10}, uniqueness: true
end
