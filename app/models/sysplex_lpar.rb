class SysplexLpar < ActiveRecord::Base
  attr_accessible :id, :lpar_id, :sysplex_id
  belongs_to :lpar
  belongs_to :sysplex
  
  validates :lpar_id, uniqueness: true
  validates :sysplex_id, uniqueness: true
end
