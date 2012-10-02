class Location < ActiveRecord::Base
  attr_accessible :address, :id, :name, :phone
  has_many :machine_locs
  has_many :machines, through: :machine_locs
  
  def self.lparList(loc)
    @lparList = Array.new
    Location.find(loc).machines.each do |m|
      m.lpars.each do |l|
        if(Ziip.exists?(LPAR: l.name))
          @lparList.push(l)
        end
      end
    end
    return @lparList
  end
end
