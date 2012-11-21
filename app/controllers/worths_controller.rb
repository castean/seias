class WorthsController < ApplicationController
  load_and_authorize_resource
  # GET /worths
  # GET /worths.json
  def index
    @worths = Worth.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @worths }
    end
  end

  # GET /worths/1
  # GET /worths/1.json
  def show
    @worth = Worth.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @worth }
    end
  end

  # GET /worths/new
  # GET /worths/new.json
  def new
    @worth = Worth.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @worth }
    end
  end

  # GET /worths/1/edit
  def edit
    @worth = Worth.find(params[:id])
  end

  # POST /worths
  # POST /worths.json
  def create
    @worth = Worth.new(params[:worth])

    respond_to do |format|
      if @worth.save
        format.html { redirect_to @worth, notice: 'Worth was successfully created.' }
        format.json { render json: @worth, status: :created, location: @worth }
      else
        format.html { render action: "new" }
        format.json { render json: @worth.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /worths/1
  # PUT /worths/1.json
  def update
    @worth = Worth.find(params[:id])

    respond_to do |format|
      if @worth.update_attributes(params[:worth])
        format.html { redirect_to @worth, notice: 'Worth was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @worth.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /worths/1
  # DELETE /worths/1.json
  def destroy
    @worth = Worth.find(params[:id])
    @worth.destroy

    respond_to do |format|
      format.html { redirect_to worths_url }
      format.json { head :no_content }
    end
  end
end
