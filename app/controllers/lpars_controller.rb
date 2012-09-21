class LparsController < ApplicationController
  before_filter :authenticate_user!
  # GET /lpars
  # GET /lpars.json
  def index
    @lpars = Lpar.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lpars }
      format.xls
      format.pdf do
        pdf = LparsPdf.new(@lpars)
        send_data pdf.render, filename: "LPARS.pdf", type: "application/pdf", disposition: "inline"
      end
    end
  end

  # GET /lpars/1
  # GET /lpars/1.json
  def show
    @lpar = Lpar.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lpar }
    end
  end

  # GET /lpars/new
  # GET /lpars/new.json
  def new
    @lpar = Lpar.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lpar }
    end
  end

  # GET /lpars/1/edit
  def edit
    @lpar = Lpar.find(params[:id])
  end

  # POST /lpars
  # POST /lpars.json
  def create
    @lpar = Lpar.new(params[:lpar])

    respond_to do |format|
      if @lpar.save
        format.html { redirect_to @lpar, notice: 'Lpar was successfully created.' }
        format.json { render json: @lpar, status: :created, location: @lpar }
      else
        format.html { render action: "new" }
        format.json { render json: @lpar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lpars/1
  # PUT /lpars/1.json
  def update
    @lpar = Lpar.find(params[:id])

    respond_to do |format|
      if @lpar.update_attributes(params[:lpar])
        format.html { redirect_to @lpar, notice: 'Lpar was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lpar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lpars/1
  # DELETE /lpars/1.json
  def destroy
    @lpar = Lpar.find(params[:id])
    @lpar.destroy

    respond_to do |format|
      format.html { redirect_to lpars_url }
      format.json { head :no_content }
    end
  end
end
