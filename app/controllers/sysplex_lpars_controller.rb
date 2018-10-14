class SysplexLparsController < ApplicationController
  # GET /sysplex_lpars
  # GET /sysplex_lpars.json
  def index
    @sysplex_lpars = SysplexLpar.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sysplex_lpars }
    end
  end

  # GET /sysplex_lpars/1
  # GET /sysplex_lpars/1.json
  def show
    @sysplex_lpar = SysplexLpar.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sysplex_lpar }
    end
  end

  # GET /sysplex_lpars/new
  # GET /sysplex_lpars/new.json
  def new
    @sysplex_lpar = SysplexLpar.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sysplex_lpar }
    end
  end

  # GET /sysplex_lpars/1/edit
  def edit
    @sysplex_lpar = SysplexLpar.find(params[:id])
  end

  # POST /sysplex_lpars
  # POST /sysplex_lpars.json
  def create
    @sysplex_lpar = SysplexLpar.new(params[:sysplex_lpar])

    respond_to do |format|
      if @sysplex_lpar.save
        format.html { redirect_to @sysplex_lpar, notice: 'Sysplex lpar was successfully created.' }
        format.json { render json: @sysplex_lpar, status: :created, location: @sysplex_lpar }
      else
        format.html { render action: "new" }
        format.json { render json: @sysplex_lpar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sysplex_lpars/1
  # PUT /sysplex_lpars/1.json
  def update
    @sysplex_lpar = SysplexLpar.find(params[:id])

    respond_to do |format|
      if @sysplex_lpar.update_attributes(params[:sysplex_lpar])
        format.html { redirect_to @sysplex_lpar, notice: 'Sysplex lpar was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sysplex_lpar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sysplex_lpars/1
  # DELETE /sysplex_lpars/1.json
  def destroy
    @sysplex_lpar = SysplexLpar.find(params[:id])
    @sysplex_lpar.destroy

    respond_to do |format|
      format.html { redirect_to sysplex_lpars_url }
      format.json { head :no_content }
    end
  end
end
