class MachineLpar < ActiveRecord::Base
  attr_accessible :id, :lpar_id, :machine_id
  belongs_to :lpar
  belongs_to :machine
  
  validates :lpar_id, uniqueness: true
  
end
