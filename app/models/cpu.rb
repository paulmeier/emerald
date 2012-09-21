class Cpu < ActiveRecord::Base
  require "Date.rb"
  require 'csv'
  
  establish_connection :smfdata
  
  attr_accessor :lpars, :maxMips, :includeWeights, :totalMips, :timeBands, :month, :from, :to, :graphtype, :months, :machines, :increment, :data
  attr_accessible :datetime, :id, :mips, :smfid, :lpars, :maxMips, :includeWeights, :totalMips, :timeBands, :month, :from, :to, :graphtype, :months, :machines, :increment, :data
  
  belongs_to :machine
  by_star_field :datetime
  
  def after_initialize 
    self.lpars ||= {}
    self.machines ||= {}
  end
  
  #Parse a cpudata csv file
  def self.parseCSV(filename)
    CSV.foreach('/home/ftp/mips/' + filename, col_sep: ',') do |row|
      date = row[1]
      month = date[0,2]
      day = date[3,2]
      year = date[6,2].to_i + 2000
      date = year.to_s + "-" + month + "-" + day + " " + row[2]
      Cpu.create(datetime: date, smfid: row[0], mips: row[3])
    end
      File.delete('/home/ftp/mips/' + filename) 
  end
  
  #Find each LPARs cpu or MIPS peak use. smfid, max, and average returned.
  def self.findLPARpeaks(mid)
    @Machine = Machine.find(mid)
    Cpu.find(:all, :group => "smfid", :select => "smfid, max(mips) as max, AVG(mips) as average", :conditions => ['smfid in (?)', @Machine.lpars.map(&:smfid)])
  end
  
  #Find the peak period of the BOX and how much MIPS it is using total. datetime and peak returned.
  def self.findBOXpeaks(mid)
    @Machine = Machine.find(mid)
    Cpu.find(:all, :group => "date(datetime),time(datetime)", :select => "datetime ,sum(mips) as peak", :order => "peak DESC", :conditions => ['smfid in (?)', @Machine.lpars.map(&:smfid)])
  end
  
  #Find the average MIPS the BOX uses.
  def self.findBOXaverage(mid)
    @Machine = Machine.find(mid)
    @mipsSum = Cpu.find(:all, :group => "date(DateTime),time(DateTime)", :select => "sum(mips) as average", :conditions => ['smfid in (?)', @Machine.lpars.map(&:smfid)])
    sum = 0
    @mipsSum.each_with_index do |m,i|
      sum += @mipsSum[i].average.to_f 
    end
    
    return (sum / @mipsSum.count).round  
  end 
end
