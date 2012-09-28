class LparConfigsController < ApplicationController

  # GET /lpar_configs
  # GET /lpar_configs.json
  def index
    @lpar_configs = LparConfig.includes(:lpar).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lpar_configs }
      format.xls
      format.pdf do
        pdf = LparConfigsPdf.new(@lpar_configs, view_context)
        send_data pdf.render, filename: "LPAR_CONFIGS.pdf", type: "application/pdf", disposition: "inline"
      end
    end
  end

  # GET /lpar_configs/1
  # GET /lpar_configs/1.json
  def show
    @lpar_config = LparConfig.includes(:lpar).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lpar_config }
    end
  end

  # GET /lpar_configs/new
  # GET /lpar_configs/new.json
  def new
    @lpar_config = LparConfig.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lpar_config }
    end
  end

  # GET /lpar_configs/1/edit
  def edit
    @lpar_config = LparConfig.find(params[:id])
  end

  # POST /lpar_configs
  # POST /lpar_configs.json
  def create
    @lpar_config = LparConfig.new(params[:lpar_config])

    respond_to do |format|
      if @lpar_config.save
        format.html { redirect_to @lpar_config, notice: 'Lpar config was successfully created.' }
        format.json { render json: @lpar_config, status: :created, location: @lpar_config }
      else
        format.html { render action: "new" }
        format.json { render json: @lpar_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lpar_configs/1
  # PUT /lpar_configs/1.json
  def update
    @lpar_config = LparConfig.find(params[:id])

    respond_to do |format|
      if @lpar_config.update_attributes(params[:lpar_config])
        format.html { redirect_to @lpar_config, notice: 'Lpar config was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lpar_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lpar_configs/1
  # DELETE /lpar_configs/1.json
  def destroy
    @lpar_config = LparConfig.find(params[:id])
    @lpar_config.destroy

    respond_to do |format|
      format.html { redirect_to lpar_configs_url }
      format.json { head :no_content }
    end
  end
  
end
