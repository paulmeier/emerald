class Ziip < ActiveRecord::Base
  
  #Connect to SMFDATA database to grab ZIIP information
  establish_connection :smfdata
  attr_accessor :from, :to, :data, :increment, :lpars, :includeWeights, :machines, :maxMips, :graphtype, :totalMips
  attr_accessible :DateTime, :LPAR, :PCTBOX, :id, :from, :to, :data, :increment, :lpars, :includeWeights, :machines, :maxMips, :graphtype, :totalMips 
    
  #Use by_star for better time manipulation. Tell bystar that the datetime feild is datetime format.
  by_star_field :DateTime
  
  def after_initialize 
    self.lpars ||= {}
    self.machines ||= {}
  end
  
  def canned
    @lpars = Lpar.all
  end  
  
  #Parse a ziipdata csv file. Just tell it what date. (Format: ziipdata_MM-DD-YY.csv) e.g 1.day.ago.strftime("%m-%d-%y")
  def self.parseCSV(filename)
    FasterCSV.foreach('/home/ftp/ziip/' + filename, col_sep: ',') do |row|
      date = row[0]
      month = date[0,2]
      day = date[2,2]
      year = date[4,2].to_i + 2000
      date = year.to_s + "-" + month + "-" + day + " " + row[1]
      Ziip.create(DateTime: date, LPAR: row[2], PCTBOX: row[3])
    end
  end
  
  #Find collection of LPARs cpu or MIPS peak use. name, datetime, and max returned.
  def self.findLPARpeaks(lpars)
    Ziip.find(:all, :group => "LPAR", :select => "LPAR, DateTime, max(PCTBOX) as max", :conditions => ['LPAR in (?)', lpars.map(&:name)])
  end
  
  #Find each LPARs cpu or MIPS peak use. name, max, and average returned.
  def self.findBoxLPARpeaks(mid)
    find_machine(mid)
    Ziip.find(:all, :group => "LPAR", :select => "LPAR, max(PCTBOX) as max, AVG(PCTBOX) as average", :conditions => ['LPAR in (?)', @Machine.lpars.map(&:name)])
  end
  
  #Find the peak period of the BOX and how much MIPS it is using total. datetime and peak returned.
  def self.findBoxPeaks(mid)
    find_machine(mid)
    Ziip.find(:all, :group => "date(DateTime),time(DateTime)", :select => "DateTime ,sum(PCTBOX) as peak", :order => "peak DESC", :conditions => ['LPAR in (?)', @Machine.lpars.map(&:name)]).first
  end
  
  #Find the average MIPS the BOX uses.
  def self.findBoxAverage(mid)
    
    @ziipSum = Ziip.find(:all, :group => "date(datetime),time(datetime)", :select => "sum(PCTBOX) as average", :conditions => ['LPAR in (?)', @Machine.lpars.map(&:name)])
    sum = 0
    @ziipSum.each_with_index do |m,i|
      sum += @ziipSum[i].average.to_f 
    end
    
    return (sum / @ziipSum.count)  
  end
  
  #Converts a string date in the format "YYYY-MM-DD HH:MM:SS" to epoch time
  def self.datetime_to_epoch(datetime)
    Time.local(datetime.strftime('%Y').to_i, datetime.strftime('%m').to_i, datetime.strftime('%d').to_i, datetime.strftime('%H').to_i, datetime.strftime('%M').to_i, datetime.strftime('%S').to_i).to_i * 1000
  end
  
  #Find LPAR average ZIIP useage by day. Numbers are in percent (from database)
  def self.getZiipAverageByDay(from, to, lparId)
    @totals = Array.new
    (Ziip.between(from,to).where(LPAR: Lpar.find(lparId).name).group("date(DateTime)").select("AVG(PCTBOX) as average")).each do |i|
      @totals.push(i.average)
    end
    return @totals     
  end
  
  #Find CEC average ZIIP useage by day. Numbers are in percent (from database)
  def self.getZiipBoxAverageByDay(from, to, machineId)
    @totals = Array.new
    (Ziip.between(from,to).where('LPAR in (?)', find_machine(machineId).lpars.map(&:name)).group("date(DateTime)").select("AVG(PCTBOX) as dayTotal")).each do |i|
      @totals.push(i.dayTotal)
    end
    return @totals     
  end
  private
  #Private method to find a machine
  def self.find_machine(mid)
    @Machine = Machine.find(mid)
  end
end
