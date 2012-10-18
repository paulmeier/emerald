class LparConfig < ActiveRecord::Base
  attr_accessible :codedWeight, :id, :ifl, :localEngines, :lpar_id, :reservedStorage, :runningWeight, :storageCbu,
  :storageNormal, :zaap, :zaapWeight, :ziip, :ziipWeight, :capValue
  
  belongs_to :lpar
  
  validates :codedWeight, presence: true, length: { minimum: 1, maximum: 4}, numericality: true
  validates :localEngines, presence: true, length: { minimum: 1, maximum: 3 }, numericality: true                          
  validates :reservedStorage, presence: true, length: { minimum: 1, maximum: 20 }, numericality: true                              
  validates :runningWeight, presence: true, length: { minimum: 1, maximum: 4 }, numericality: true                             
  validates :storageCbu, presence: true, length: { minimum: 1, maximum: 20 }, numericality: true                         
  validates :storageNormal, presence: true, length: { minimum: 1, maximum: 20 }, numericality: true
  validates :capValue, length: { minimum: 0, maximum: 3 }, numericality: { less_than_or_equal_to: 100 }                          
  validates :zaap, length: { minimum: 1, maximum: 3 }, numericality: true
  validates :ifl, length: { minimum: 1, maximum: 3 }, numericality: true                   
  validates :zaapWeight, length: { minimum: 1, maximum: 4 }, numericality: true  
  validates :ziip, length: { minimum: 1, maximum: 3 }, numericality: true                   
  validates :ziipWeight, length: { minimum: 1, maximum: 4 }, numericality: true  
  validates :lpar_id, uniqueness: true, presence: true, numericality: true
  
  def self.verifyWeights
    @machines = Machine.includes(:lpars).all
      @machines.each_with_index do |m,i|
        sum = LparConfig.sum(:codedWeight, :conditions => ['lpar_id in (?)', @machines[0].lpars.map(&:id)])      
        if (sum < 99 || sum > 100) && !(Notification.exists?(msg: m.name + " weight total is wrong. It's " + sum.to_s + "."))
          Notification.create( name: "error", msg: m.name + " weight total is wrong. It's " + sum.to_s + ".")
        end
     end
  end
  
  #Verifying storage amount added up is not greater than the machines total storage amount minus 16GB for HSA.
  #This adds all LPAR weights to account for CBU.
  def self.verifyStorage
    @machines = Machine.includes(:lpars).includes(:machineConfig).all
      @machines.each do |m|
        sum = LparConfig.sum(:storageNormal)      
        if ( sum > (m.machineConfig.centralStorage - 16000) ) && !(Notification.exists?(msg: m.name + " storage is wrong. It's " + sum.to_s))
          Notification.create( name: "error", msg: m.name + " storage is wrong. It's " + sum.to_s)
        end
     end
  end
  
  def self.mipsCap(id)
    @lpar = Lpar.includes(:machines).find(id)
    
    msuPerEngine = MachineConfig.msuPerEngine(@lpar.machines[0].id)
    machineCpPerEngine = MachineConfig.machineCpPerShare(@lpar.machines[0].id)
    perCpShare = LparConfig.perCpShare(id)
    
    if(@lpar.lparConfig.capValue == 0 && ((@lpar.lparConfig.capValue * msuPerEngine) < (@lpar.lparConfig.localEngines * perCpShare)))
      sum = (@lpar.lparConfig.localEngines * machineCpPerEngine).round   
    else
      sum = (msuPerEngine * @lpar.lparConfig.capValue).round
    end
  end
  
  def self.msuWeight(id)
    @lpar = Lpar.includes(:machines).find(id)
    (((@lpar.lparConfig.runningWeight.to_f / 100) * @lpar.machines[0].machineConfig.capacity.mips.to_f ) / (@lpar.machines[0].machineConfig.capacity.mips.to_f / @lpar.machines[0].machineConfig.capacity.msu.to_f)).round
  end
  
  def self.maxMips(id)
    @lpar = Lpar.includes(:machines).find(id)
    ((@lpar.lparConfig.runningWeight.to_f / 100) * @lpar.machines[0].machineConfig.capacity.mips.to_f ).round
  end
  
  def self.maxKick(id)
    @lpar = Lpar.includes(:machines).find(id)
    (LparConfig.mipsCap(id) - ((@lpar.lparConfig.runningWeight.to_f / 100) * @lpar.machines[0].machineConfig.capacity.mips.to_f )).round
  end
  
  def self.perCpShare(id)
    @lpar = Lpar.includes(:machines).find(id)
    ((LparConfig.gpv(id) / @lpar.lparConfig.localEngines) * MachineConfig.machineCpPerShare(@lpar.machines[0].id)).round
  end
  
  def self.gpv(id)
    @lpar = Lpar.includes(:machines).find(id)
    (((@lpar.lparConfig.runningWeight.to_f / 100) * (@lpar.machines[0].machineConfig.capacity.capSetting % 100))).round(2)
  end
  
  def self.weightMIPS(id)
    @lpar = Lpar.includes(:machines).find(id)
    ((@lpar.lparConfig.runningWeight.to_f / 100) * @lpar.machines[0].machineConfig.capacity.mips.to_f).round
  end
end
