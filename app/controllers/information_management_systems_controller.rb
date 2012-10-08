class InformationManagementSystemsController < ApplicationController
  # GET /information_management_systems
  # GET /information_management_systems.json
  def index
    @information_management_systems = InformationManagementSystem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @information_management_systems }
    end
  end

  # GET /information_management_systems/1
  # GET /information_management_systems/1.json
  def show
    @information_management_system = InformationManagementSystem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @information_management_system }
    end
  end

  # GET /information_management_systems/new
  # GET /information_management_systems/new.json
  def new
    @information_management_system = InformationManagementSystem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @information_management_system }
    end
  end

  # GET /information_management_systems/1/edit
  def edit
    @information_management_system = InformationManagementSystem.find(params[:id])
  end

  # POST /information_management_systems
  # POST /information_management_systems.json
  def create
    @information_management_system = InformationManagementSystem.new(params[:information_management_system])

    respond_to do |format|
      if @information_management_system.save
        format.html { redirect_to @information_management_system, notice: 'Information management system was successfully created.' }
        format.json { render json: @information_management_system, status: :created, location: @information_management_system }
      else
        format.html { render action: "new" }
        format.json { render json: @information_management_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /information_management_systems/1
  # PUT /information_management_systems/1.json
  def update
    @information_management_system = InformationManagementSystem.find(params[:id])

    respond_to do |format|
      if @information_management_system.update_attributes(params[:information_management_system])
        format.html { redirect_to @information_management_system, notice: 'Information management system was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @information_management_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /information_management_systems/1
  # DELETE /information_management_systems/1.json
  def destroy
    @information_management_system = InformationManagementSystem.find(params[:id])
    @information_management_system.destroy

    respond_to do |format|
      format.html { redirect_to information_management_systems_url }
      format.json { head :no_content }
    end
  end
end
