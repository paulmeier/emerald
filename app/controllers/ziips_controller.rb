class ZiipsController < ApplicationController
  
  #For future dates (e.g. 2.weeks.from_now)
  require 'active_support/core_ext/numeric/time'
  
  # GET /ziips
  # GET /ziips.json
  def index
    @ziips = Ziip.paginate(:page => params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ziips }
      format.js
    end
  end

  # GET /ziips/1
  # GET /ziips/1.json
  def show
    @ziip = Ziip.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ziip }
    end
  end

  # GET /ziips/new
  # GET /ziips/new.json
  def new
    @ziip = Ziip.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ziip }
    end
  end

  # GET /ziips/1/edit
  def edit
    @ziip = Ziip.find(params[:id])
  end

  # POST /ziips
  # POST /ziips.json
  def create
    @ziip = Ziip.new(params[:ziip])

    respond_to do |format|
      if @ziip.save
        format.html { redirect_to @ziip, notice: 'Ziip was successfully created.' }
        format.json { render json: @ziip, status: :created, location: @ziip }
      else
        format.html { render action: "new" }
        format.json { render json: @ziip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ziips/1
  # PUT /ziips/1.json
  def update
    @ziip = Ziip.find(params[:id])

    respond_to do |format|
      if @ziip.update_attributes(params[:ziip])
        format.html { redirect_to @ziip, notice: 'Ziip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ziip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ziips/1
  # DELETE /ziips/1.json
  def destroy
    @ziip = Ziip.find(params[:id])
    @ziip.destroy

    respond_to do |format|
      format.html { redirect_to ziips_url }
      format.json { head :no_content }
    end
  end
  
  def zday
    @ziipTotal = Ziip.between(params[:from],params[:to]).where(:LPAR => params[:scope]).group("date(DateTime)").select("DateTime, AVG(PCTBOX) as average")
      respond_to do |format|
      #format.html # show.html.erb
      format.json { render json: @ziipTotal }
    end
  end

  def ztotal
    @ziipTotal = Ziip.between(params[:from],params[:to]).where(:LPAR => params[:scope]).select("AVG(PCTBOX) as average")
      respond_to do |format|
      #format.html # show.html.erb
      format.json { render json: @ziipTotal }
    end
  end
  
  def ztotal2
    @ziipTotal2 = Ziip.between(params[:from],params[:to]).group("date(DateTime)").select("DateTime, AVG(PCTBOX) as average")
      respond_to do |format|
      #format.html # show.html.erb
      format.json { render json: @ziipTotal2 }
    end
  end
  
  def zHour
    @ziipHour = Ziip.between(params[:from],params[:to]).where(:LPAR => params[:scope]).group("date(DateTime),hour(DateTime)").select("DateTime, PCTBOX")
      respond_to do |format|
      #format.html # show.html.erb
      format.json { render json: @ziipHour }
    end
  end
  
   def zAll
    @zAll = Ziip.where(:LPAR => params[:lpar]).group("DateTime").select("DateTime, PCTBOX")
      respond_to do |format|
      #format.html # show.html.erb
      format.json { render json: @zAll }
    end
  end
  
  def zAllAvg
    @machine = Machine.includes(:lpars).where(:id => params[:machine_id])
    @zAll = Ziip.find(:all, :group => "date(DateTime),time(DateTime)", :select => "DateTime, sum(PCTBOX) as average", :conditions => ['LPAR in (?)', @machine[0].lpars.map(&:name)])
      respond_to do |format|
      #format.html # show.html.erb
      format.json { render json: @zAll }
    end
  end
  
  def monAvg
    #For a Rails bug. Puts one blank array slot.
    params[:ziip][:lpars] = params[:ziip][:lpars].delete_if{ |x| x.empty? }
    params[:ziip][:machines] = params[:ziip][:machines].delete_if{ |x| x.empty? }
  end
  
  def twoweekavg    
    #For a Rails bug. Puts one blank array slot.
    params[:ziip][:lpars] = params[:ziip][:lpars].delete_if{ |x| x.empty? }
    params[:ziip][:machines] = params[:ziip][:machines].delete_if{ |x| x.empty? }
  end
  
  def twoweektot    
    #For a Rails bug. Puts one blank array slot.
    params[:ziip][:lpars] = params[:ziip][:lpars].delete_if{ |x| x.empty? }
    params[:ziip][:machines] = params[:ziip][:machines].delete_if{ |x| x.empty? }
  end
  
  def canned
    gon.startDate = Ziip.first(order: 'DateTime asc').DateTime
    @ziips = Ziip.new
  end
  
  def custom
    gon.startDate = Ziip.first(order: 'DateTime asc').DateTime
    @ziips = Ziip.new
  end
  
  def peaksGraph
    @ziips = Ziip.new
    
    #For a Rails bug. Puts one blank array slot.
    params[:ziip][:lpars] = params[:ziip][:lpars].delete_if{ |x| x.empty? }
    params[:ziip][:machines] = params[:ziip][:machines].delete_if{ |x| x.empty? }
    
    @lpars = Lpar.find(params[:ziip][:lpars])
    @lparPeaks = Ziip.findLPARpeaks(@lpars)
    
    @machinePeaks = Array.new
    params[:ziip][:machines].each do |m|
      @machinePeaks.push(Ziip.findBoxPeaks(m))
    end
  end
  
end
