#encoding:utf-8
#require "csv"
class PlacesController < ApplicationController
  load_and_authorize_resource
  # GET /places
  # GET /places.json
  def index
    @places = Place.order("place_type_id").order("town_id").order("name").page(params[:page]).per(30)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @places }
    end
  end

#-----------------------------------CSV Code-------------------------
#  def place_import
#    data = params[:dump][:file].read
#    @place=CSV.parse(data)
#    n=0
#    @place.each do |row|
#      c=Place.new
#        c.name = row[2]
#        c.info = row[3]
#        c.latitude = row[0]
#        c.longitude = row[1]
#        c.gmaps  = true
#      if c.save
#        n=n+1
#        GC.start if n%50==0
#      end
#      
#    end
#  end
  
#-------------------------------------------------------------  
  
  # GET /places/1
  # GET /places/1.json
  def show
    @place = Place.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @place }
    end
  end

  # GET /places/new
  # GET /places/new.json
  def new
    @place = Place.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @place }
    end
  end

  # GET /places/1/edit
  def edit
    @place = Place.find(params[:id])
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(params[:place])

    respond_to do |format|
      if @place.save
        format.html { redirect_to @place, notice: 'Place was successfully created.' }
        format.json { render json: @place, status: :created, location: @place }
      else
        format.html { render action: "new" }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /places/1
  # PUT /places/1.json
  def update
    @place = Place.find(params[:id])

    respond_to do |format|
      if @place.update_attributes(params[:place])
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place = Place.find(params[:id])
    @place.destroy

    respond_to do |format|
      format.html { redirect_to places_url }
      format.json { head :no_content }
    end
  end
end
