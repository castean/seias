require "CSV"
class TownsController < ApplicationController
  # GET /towns
  # GET /towns.json
  def index
    @towns = Town.order("state_id").page(params[:page]).per(50)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @towns }
    end
  end

#-----------------------------------CSV Code-------------------------
  def town_import
    data = params[:dump][:file].read
    @town=CSV.parse(data)
    n=0
    @town.each do |row|
      c=Town.new
        c.cve_loc = row[4]
        c.name = row[5]
        c.county_id = row[2]
        c.environment  = row[6]
        c.latitude = row[7]
        c.length = row[8]
        c.lat_dec  = row[9]
        c.leng_dec  = row[10]
        c.altitud  = row[11]
        c.cve_carta = row[12]
      if c.save
        n=n+1
        GC.start if n%50==0
      end
      
    end
  end
#-------------------------------------------------------------

  # GET /towns/1
  # GET /towns/1.json
  def show
    @town = Town.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @town }
    end
  end

  # GET /towns/new
  # GET /towns/new.json
  def new
    @town = Town.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @town }
    end
  end

  # GET /towns/1/edit
  def edit
    @town = Town.find(params[:id])
  end

  # POST /towns
  # POST /towns.json
  def create
    @town = Town.new(params[:town])

    respond_to do |format|
      if @town.save
        format.html { redirect_to @town, notice: 'Town was successfully created.' }
        format.json { render json: @town, status: :created, location: @town }
      else
        format.html { render action: "new" }
        format.json { render json: @town.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /towns/1
  # PUT /towns/1.json
  def update
    @town = Town.find(params[:id])

    respond_to do |format|
      if @town.update_attributes(params[:town])
        format.html { redirect_to @town, notice: 'Town was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @town.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /towns/1
  # DELETE /towns/1.json
  def destroy
    @town = Town.find(params[:id])
    @town.destroy

    respond_to do |format|
      format.html { redirect_to towns_url }
      format.json { head :no_content }
    end
  end
end
