class MachineLocsController < ApplicationController
  # GET /machine_locs
  # GET /machine_locs.json
  def index
    @machine_locs = MachineLoc.includes(:machine).includes(:location).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @machine_locs }
    end
  end

  # GET /machine_locs/1
  # GET /machine_locs/1.json
  def show
    @machine_loc = MachineLoc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @machine_loc }
    end
  end

  # GET /machine_locs/new
  # GET /machine_locs/new.json
  def new
    @machine_loc = MachineLoc.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @machine_loc }
    end
  end

  # GET /machine_locs/1/edit
  def edit
    @machine_loc = MachineLoc.find(params[:id])
  end

  # POST /machine_locs
  # POST /machine_locs.json
  def create
    @machine_loc = MachineLoc.new(params[:machine_loc])

    respond_to do |format|
      if @machine_loc.save
        format.html { redirect_to @machine_loc, notice: 'Machine loc was successfully created.' }
        format.json { render json: @machine_loc, status: :created, location: @machine_loc }
      else
        format.html { render action: "new" }
        format.json { render json: @machine_loc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /machine_locs/1
  # PUT /machine_locs/1.json
  def update
    @machine_loc = MachineLoc.find(params[:id])

    respond_to do |format|
      if @machine_loc.update_attributes(params[:machine_loc])
        format.html { redirect_to @machine_loc, notice: 'Machine loc was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @machine_loc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /machine_locs/1
  # DELETE /machine_locs/1.json
  def destroy
    @machine_loc = MachineLoc.find(params[:id])
    @machine_loc.destroy

    respond_to do |format|
      format.html { redirect_to machine_locs_url }
      format.json { head :no_content }
    end
  end
end
