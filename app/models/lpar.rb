class Lpar < ActiveRecord::Base
  attr_accessible :id, :mid, :name, :smfid
  
  has_one :lparConfig, dependent: :destroy
  has_many :machine_lpars, dependent: :destroy
  has_many :machines, through: :machine_lpars
  has_many :sysplex_lpars, dependent: :destroy
  has_many :sysplexes, through: :sysplex_lpars
  
  validates :mid, length: { minimum: 2, maximum: 5 }, presence: true, uniqueness: true
  validates :name, length: { minimum: 3, maximum: 8 }, presence: true, uniqueness: true
  validates :smfid, length: { minimum: 2, maximum: 7 }, presence: true, uniqueness: true
end
