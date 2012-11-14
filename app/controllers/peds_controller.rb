#encoding:utf-8
class PedsController < ApplicationController
  load_and_authorize_resource
  # GET /peds
  # GET /peds.json
  def index
    @peds = Ped.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @peds }
    end
  end

  # GET /peds/1
  # GET /peds/1.json
  def show
    @ped = Ped.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ped }
    end
  end

  # GET /peds/new
  # GET /peds/new.json
  def new
    @ped = Ped.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ped }
    end
  end

  # GET /peds/1/edit
  def edit
    @ped = Ped.find(params[:id])
  end

  # POST /peds
  # POST /peds.json
  def create
    @ped = Ped.new(params[:ped])

    respond_to do |format|
      if @ped.save
        format.html { redirect_to @ped, notice: 'Ped was successfully created.' }
        format.json { render json: @ped, status: :created, location: @ped }
      else
        format.html { render action: "new" }
        format.json { render json: @ped.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /peds/1
  # PUT /peds/1.json
  def update
    @ped = Ped.find(params[:id])

    respond_to do |format|
      if @ped.update_attributes(params[:ped])
        format.html { redirect_to @ped, notice: 'Ped was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ped.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /peds/1
  # DELETE /peds/1.json
  def destroy
    @ped = Ped.find(params[:id])
    @ped.destroy

    respond_to do |format|
      format.html { redirect_to peds_url }
      format.json { head :no_content }
    end
  end
end
