class Sysplex < ActiveRecord::Base
  attr_accessible :id, :name
  
  has_many :sysplex_lpars, dependent: :destroy
  has_many :lpars, through: :sysplex_lpars
end
