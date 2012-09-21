class CpusController < ApplicationController
  require 'active_support/core_ext/numeric/time'
  require "Date.rb"
  # GET /cpus
  # GET /cpus.json
  def index
    @cpus = Cpu.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cpus }
    end
  end

  # GET /cpus/1
  # GET /cpus/1.json
  def show
    @cpu = Cpu.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cpu }
    end
  end

  # GET /cpus/new
  # GET /cpus/new.json
  def new
    @cpu = Cpu.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cpu }
    end
  end

  # GET /cpus/1/edit
  def edit
    @cpu = Cpu.find(params[:id])
  end

  # POST /cpus
  # POST /cpus.json
  def create
    @cpu = Cpu.new(params[:cpu])

    respond_to do |format|
      if @cpu.save
        format.html { redirect_to @cpu, notice: 'Cpu was successfully created.' }
        format.json { render json: @cpu, status: :created, location: @cpu }
      else
        format.html { render action: "new" }
        format.json { render json: @cpu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cpus/1
  # PUT /cpus/1.json
  def update
    @cpu = Cpu.find(params[:id])

    respond_to do |format|
      if @cpu.update_attributes(params[:cpu])
        format.html { redirect_to @cpu, notice: 'Cpu was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cpu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cpus/1
  # DELETE /cpus/1.json
  def destroy
    @cpu = Cpu.find(params[:id])
    @cpu.destroy

    respond_to do |format|
      format.html { redirect_to cpus_url }
      format.json { head :no_content }
    end
  end
  
   def cAll
    @cAll = Cpu.where(:smfid => params[:lpar]).group("datetime").select("datetime, mips")
      respond_to do |format|
      #format.html # show.html.erb
      format.json { render json: @cAll }
    end
  end
  
  def totBox
    @machine = Machine.includes(:lpars).where(:id => params[:machine_id])
    @totBox= Cpu.find(:all, :group => "date(DateTime),time(DateTime)", :select => "datetime, sum(mips) as mips", :conditions => ['smfid in (?)', @machine[0].lpars.map(&:smfid)])
      respond_to do |format|
      #format.html # show.html.erb
      format.json { render json: @totBox }
    end  
  end
  #Find the machine totals for end of month
  def allCec
    @machine = Machine.includes(:lpars).where(:id => params[:machine_id])
    
    @cAllCec = Cpu.between(Date.today.beginning_of_month.previous_business_day('us'),Date.today.beginning_of_month.next_business_day('us') +1).find(:all, :group => "date(DateTime),time(DateTime)", :select => "datetime, sum(mips) as mips", :conditions => ['smfid in (?)', @machine[0].lpars.map(&:smfid)])
      respond_to do |format|
      #format.html # show.html.erb
      format.json { render json: @cAllCec }
    end
  end
  
  def ctotal
    @cTotal = Cpu.between(Date.today.beginning_of_month.previous_business_day('us'),Date.today.beginning_of_month.next_business_day('us') +1).where(:smfid => Lpar.find(params[:scope]).smfid).group("date(datetime),time(datetime)").select("datetime, mips")
      respond_to do |format|
      #format.html # show.html.erb
      format.json { render json: @cTotal }
    end
  end
  
  #Gathers the data between two dates. Displays the day and it's average use for the lpar specified in the scope.
  def cday
    @cpuTotal = Cpu.between(params[:from],params[:to]).where(:smfid => params[:scope]).group("date(datetime)").select("datetime, AVG(mips) as average")
      respond_to do |format|
      #format.html # show.html.erb
      format.json { render json: @cpuTotal }
    end
  end
  
  def allBox
    #placeholder
  end

  def all 
    #placeholder
  end
  
  def custom
    gon.startDate = Cpu.first(order: 'datetime asc').datetime 
    @cpus = Cpu.new  
  end
  
  def canned
    gon.startDate = Cpu.first(order: 'datetime asc').datetime  
    @cpus = Cpu.new    
  end
  
  def mefbdc
    @cpus = Cpu.new
  end
  
  def custgraph
  end
  
  def avgday
    @cpus = Cpu.new
    params[:cpu][:lpars] = params[:cpu][:lpars].delete_if{ |x| x.empty? }
  end
  
  def mefbd
    @lpars = Array.new
    @machines = Array.new
    @medays = Array.new
        
    #For a Rails bug. Puts one blank array slot.
    params[:cpu][:lpars] = params[:cpu][:lpars].delete_if{ |x| x.empty? }
    
    #Create my LPARS array the user selected
      params[:cpu][:lpars].each do |lpid|
        @lpars.push(Lpar.includes(:machines).includes(:lparConfig).find(lpid))
      end
      
    #Create the machines array based on the LPARS selected.
      @lpars.each do |lpar|
        @machines.push(lpar.machines)
      end
      
    #Get only unique machines from machines.
    @machines = @machines.inject([]) { |result,h| result << h unless result.include?(h); result }
    
    #Get Max Box lines
    @machConfig = Array.new
    @machines.each_with_index do |machine,index|
      @machConfig[@machines[index][0].id] = Machine.includes(:machineConfig).includes(:machine_lpars).find(@machines[index][0].id)
    end
    
  end
end
