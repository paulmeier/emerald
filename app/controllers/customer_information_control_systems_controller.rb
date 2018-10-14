class CustomerInformationControlSystemsController < ApplicationController
  # GET /customer_information_control_systems
  # GET /customer_information_control_systems.json
  def index
    @customer_information_control_systems = CustomerInformationControlSystem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @customer_information_control_systems }
    end
  end

  # GET /customer_information_control_systems/1
  # GET /customer_information_control_systems/1.json
  def show
    @customer_information_control_system = CustomerInformationControlSystem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @customer_information_control_system }
    end
  end

  # GET /customer_information_control_systems/new
  # GET /customer_information_control_systems/new.json
  def new
    @customer_information_control_system = CustomerInformationControlSystem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @customer_information_control_system }
    end
  end

  # GET /customer_information_control_systems/1/edit
  def edit
    @customer_information_control_system = CustomerInformationControlSystem.find(params[:id])
  end

  # POST /customer_information_control_systems
  # POST /customer_information_control_systems.json
  def create
    @customer_information_control_system = CustomerInformationControlSystem.new(params[:customer_information_control_system])

    respond_to do |format|
      if @customer_information_control_system.save
        format.html { redirect_to @customer_information_control_system, notice: 'Customer information control system was successfully created.' }
        format.json { render json: @customer_information_control_system, status: :created, location: @customer_information_control_system }
      else
        format.html { render action: "new" }
        format.json { render json: @customer_information_control_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /customer_information_control_systems/1
  # PUT /customer_information_control_systems/1.json
  def update
    @customer_information_control_system = CustomerInformationControlSystem.find(params[:id])

    respond_to do |format|
      if @customer_information_control_system.update_attributes(params[:customer_information_control_system])
        format.html { redirect_to @customer_information_control_system, notice: 'Customer information control system was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @customer_information_control_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_information_control_systems/1
  # DELETE /customer_information_control_systems/1.json
  def destroy
    @customer_information_control_system = CustomerInformationControlSystem.find(params[:id])
    @customer_information_control_system.destroy

    respond_to do |format|
      format.html { redirect_to customer_information_control_systems_url }
      format.json { head :no_content }
    end
  end
end
