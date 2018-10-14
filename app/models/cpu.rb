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
  
  #Convert a datetime to epoch time for Highcharts. format "YYYY-MM-DD HH:MM:SS"
  def self.datetime_to_epoch(datetime)
    Time.local(datetime.strftime('%Y').to_i, datetime.strftime('%m').to_i, datetime.strftime('%d').to_i, datetime.strftime('%H').to_i, datetime.strftime('%M').to_i, datetime.strftime('%S').to_i).to_i * 1000
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
  
  #Gets the mefbd totals by LPAR and month.
  def self.mefbdTotalsByLPAR(lid,month)
    @totals = Array.new
    (Cpu.between(Date.parse(month).beginning_of_month.previous_business_day('us'),Date.parse(month).beginning_of_month.next_business_day('us') ).where(:smfid => Lpar.find(lid).smfid).group("date(datetime),time(datetime)").select("datetime, mips")).each do |i|
      @totals.push([Cpu.datetime_to_epoch(i.datetime),i.mips])
    end
    return @totals
  end
  #Gets the mefbd totals by BOX total and month.
  def self.mefbdTotalsByBox(mid,month)
    @totals = Array.new
    @Machine = Machine.find(mid)
    Cpu.between(Date.parse(month).beginning_of_month.previous_business_day('us'),Date.parse(month).beginning_of_month.next_business_day('us') ).find(:all, :group => "date(DateTime),time(DateTime)", :select => "datetime, sum(mips) as mips", :conditions => ['smfid in (?)', @Machine.lpars.map(&:smfid)]).each do |i|
      @totals.push([Cpu.datetime_to_epoch(i.datetime),i.mips])
    end
    return @totals
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
