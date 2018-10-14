class Db2sController < ApplicationController
  # GET /db2s
  # GET /db2s.json
  def index
    @db2s = Db2.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @db2s }
    end
  end

  # GET /db2s/1
  # GET /db2s/1.json
  def show
    @db2 = Db2.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @db2 }
    end
  end

  # GET /db2s/new
  # GET /db2s/new.json
  def new
    @db2 = Db2.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @db2 }
    end
  end

  # GET /db2s/1/edit
  def edit
    @db2 = Db2.find(params[:id])
  end

  # POST /db2s
  # POST /db2s.json
  def create
    @db2 = Db2.new(params[:db2])

    respond_to do |format|
      if @db2.save
        format.html { redirect_to @db2, notice: 'Db2 was successfully created.' }
        format.json { render json: @db2, status: :created, location: @db2 }
      else
        format.html { render action: "new" }
        format.json { render json: @db2.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /db2s/1
  # PUT /db2s/1.json
  def update
    @db2 = Db2.find(params[:id])

    respond_to do |format|
      if @db2.update_attributes(params[:db2])
        format.html { redirect_to @db2, notice: 'Db2 was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @db2.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /db2s/1
  # DELETE /db2s/1.json
  def destroy
    @db2 = Db2.find(params[:id])
    @db2.destroy

    respond_to do |format|
      format.html { redirect_to db2s_url }
      format.json { head :no_content }
    end
  end
end
