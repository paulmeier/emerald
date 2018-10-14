class MachineLparsController < ApplicationController

  # GET /machine_lpars
  # GET /machine_lpars.json
  def index
    @machine_lpars = MachineLpar.includes(:machine).includes(:lpar).all

    respond_to do |format|
      format.html # index.html.erb
      format.xls
      format.json { render json: @machine_lpars }
      format.pdf do
        pdf = MachineLparsPdf.new(@machine_lpars, view_context)
        send_data pdf.render, filename: "MachineLpars.pdf", type: "application/pdf", disposition: "inline"
      end
    end
  end

  # GET /machine_lpars/1
  # GET /machine_lpars/1.json
  def show
    @machine_lpar = MachineLpar.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @machine_lpar }
    end
  end

  # GET /machine_lpars/new
  # GET /machine_lpars/new.json
  def new
    @machine_lpar = MachineLpar.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @machine_lpar }
    end
  end

  # GET /machine_lpars/1/edit
  def edit
    @machine_lpar = MachineLpar.find(params[:id])
  end

  # POST /machine_lpars
  # POST /machine_lpars.json
  def create
    @machine_lpar = MachineLpar.new(params[:machine_lpar])

    respond_to do |format|
      if @machine_lpar.save
        format.html { redirect_to @machine_lpar, notice: 'Machine lpar was successfully created.' }
        format.json { render json: @machine_lpar, status: :created, location: @machine_lpar }
      else
        format.html { render action: "new" }
        format.json { render json: @machine_lpar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /machine_lpars/1
  # PUT /machine_lpars/1.json
  def update
    @machine_lpar = MachineLpar.find(params[:id])

    respond_to do |format|
      if @machine_lpar.update_attributes(params[:machine_lpar])
        format.html { redirect_to @machine_lpar, notice: 'Machine lpar was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @machine_lpar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /machine_lpars/1
  # DELETE /machine_lpars/1.json
  def destroy
    @machine_lpar = MachineLpar.find(params[:id])
    @machine_lpar.destroy

    respond_to do |format|
      format.html { redirect_to machine_lpars_url }
      format.json { head :no_content }
    end
  end
end
