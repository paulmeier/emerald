class MachineConfigsController < ApplicationController

  # GET /machine_configs
  # GET /machine_configs.json
  def index
    @machine_configs = MachineConfig.includes(:machine).includes(:mod).includes(:capacity).all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @machine_configs }
      format.xls
      format.pdf do
          pdf = MachineConfigsPdf.new(@machine_configs, view_context)
          send_data pdf.render, filename: "MACHINE_CONFIGS.pdf", type: "application/pdf", disposition: "inline"
      end
    end
  end

  # GET /machine_configs/1
  # GET /machine_configs/1.json
  def show
    @machine_config = MachineConfig.includes(:machine).includes(:mod).includes(:capacity).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @machine_config }
    end
  end

  # GET /machine_configs/new
  # GET /machine_configs/new.json
  def new
    @machine_config = MachineConfig.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @machine_config }
    end
  end

  # GET /machine_configs/1/edit
  def edit
    @machine_config = MachineConfig.find(params[:id])
  end

  # POST /machine_configs
  # POST /machine_configs.json
  def create
    @machine_config = MachineConfig.new(params[:machine_config])

    respond_to do |format|
      if @machine_config.save
        format.html { redirect_to @machine_config, notice: 'Machine config was successfully created.' }
        format.json { render json: @machine_config, status: :created, location: @machine_config }
      else
        format.html { render action: "new" }
        format.json { render json: @machine_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /machine_configs/1
  # PUT /machine_configs/1.json
  def update
    @machine_config = MachineConfig.find(params[:id])

    respond_to do |format|
      if @machine_config.update_attributes(params[:machine_config])
        format.html { redirect_to @machine_config, notice: 'Machine config was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @machine_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /machine_configs/1
  # DELETE /machine_configs/1.json
  def destroy
    @machine_config = MachineConfig.find(params[:id])
    @machine_config.destroy

    respond_to do |format|
      format.html { redirect_to machine_configs_url }
      format.json { head :no_content }
    end
  end
end
