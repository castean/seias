class DiscapacityOriginsController < ApplicationController
  load_and_authorize_resource
  # GET /discapacity_origins
  # GET /discapacity_origins.json
  def index
    @discapacity_origins = DiscapacityOrigin.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @discapacity_origins }
    end
  end

  # GET /discapacity_origins/1
  # GET /discapacity_origins/1.json
  def show
    @discapacity_origin = DiscapacityOrigin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @discapacity_origin }
    end
  end

  # GET /discapacity_origins/new
  # GET /discapacity_origins/new.json
  def new
    @discapacity_origin = DiscapacityOrigin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @discapacity_origin }
    end
  end

  # GET /discapacity_origins/1/edit
  def edit
    @discapacity_origin = DiscapacityOrigin.find(params[:id])
  end

  # POST /discapacity_origins
  # POST /discapacity_origins.json
  def create
    @discapacity_origin = DiscapacityOrigin.new(params[:discapacity_origin])

    respond_to do |format|
      if @discapacity_origin.save
        format.html { redirect_to @discapacity_origin, notice: 'Discapacity origin was successfully created.' }
        format.json { render json: @discapacity_origin, status: :created, location: @discapacity_origin }
      else
        format.html { render action: "new" }
        format.json { render json: @discapacity_origin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /discapacity_origins/1
  # PUT /discapacity_origins/1.json
  def update
    @discapacity_origin = DiscapacityOrigin.find(params[:id])

    respond_to do |format|
      if @discapacity_origin.update_attributes(params[:discapacity_origin])
        format.html { redirect_to @discapacity_origin, notice: 'Discapacity origin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @discapacity_origin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discapacity_origins/1
  # DELETE /discapacity_origins/1.json
  def destroy
    @discapacity_origin = DiscapacityOrigin.find(params[:id])
    @discapacity_origin.destroy

    respond_to do |format|
      format.html { redirect_to discapacity_origins_url }
      format.json { head :no_content }
    end
  end
end
