class Location < ActiveRecord::Base
  attr_accessible :address, :id, :name, :phone
  has_many :machine_locs
  has_many :machines, through: :machine_locs
  
  def self.lparList(loc)
    @lparList = Array.new
    Location.find(loc).machines.each do |m|
      m.lpars.each do |l|
        @lparList.push(l)
      end
    end
    return @lparList
  end
end
