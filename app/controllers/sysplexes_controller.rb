class SysplexesController < ApplicationController
  # GET /sysplexes
  # GET /sysplexes.json
  def index
    @sysplexes = Sysplex.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sysplexes }
    end
  end

  # GET /sysplexes/1
  # GET /sysplexes/1.json
  def show
    @sysplex = Sysplex.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sysplex }
    end
  end

  # GET /sysplexes/new
  # GET /sysplexes/new.json
  def new
    @sysplex = Sysplex.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sysplex }
    end
  end

  # GET /sysplexes/1/edit
  def edit
    @sysplex = Sysplex.find(params[:id])
  end

  # POST /sysplexes
  # POST /sysplexes.json
  def create
    @sysplex = Sysplex.new(params[:sysplex])

    respond_to do |format|
      if @sysplex.save
        format.html { redirect_to @sysplex, notice: 'Sysplex was successfully created.' }
        format.json { render json: @sysplex, status: :created, location: @sysplex }
      else
        format.html { render action: "new" }
        format.json { render json: @sysplex.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sysplexes/1
  # PUT /sysplexes/1.json
  def update
    @sysplex = Sysplex.find(params[:id])

    respond_to do |format|
      if @sysplex.update_attributes(params[:sysplex])
        format.html { redirect_to @sysplex, notice: 'Sysplex was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sysplex.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sysplexes/1
  # DELETE /sysplexes/1.json
  def destroy
    @sysplex = Sysplex.find(params[:id])
    @sysplex.destroy

    respond_to do |format|
      format.html { redirect_to sysplexes_url }
      format.json { head :no_content }
    end
  end
end
