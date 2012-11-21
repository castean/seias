class DiscapacitiesController < ApplicationController
  load_and_authorize_resource
  # GET /discapacities
  # GET /discapacities.json
  def index
    @discapacities = Discapacity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @discapacities }
    end
  end

  # GET /discapacities/1
  # GET /discapacities/1.json
  def show
    @discapacity = Discapacity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @discapacity }
    end
  end

  # GET /discapacities/new
  # GET /discapacities/new.json
  def new
    @discapacity = Discapacity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @discapacity }
    end
  end

  # GET /discapacities/1/edit
  def edit
    @discapacity = Discapacity.find(params[:id])
  end

  # POST /discapacities
  # POST /discapacities.json
  def create
    @discapacity = Discapacity.new(params[:discapacity])

    respond_to do |format|
      if @discapacity.save
        format.html { redirect_to @discapacity, notice: 'Discapacity was successfully created.' }
        format.json { render json: @discapacity, status: :created, location: @discapacity }
      else
        format.html { render action: "new" }
        format.json { render json: @discapacity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /discapacities/1
  # PUT /discapacities/1.json
  def update
    @discapacity = Discapacity.find(params[:id])

    respond_to do |format|
      if @discapacity.update_attributes(params[:discapacity])
        format.html { redirect_to @discapacity, notice: 'Discapacity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @discapacity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discapacities/1
  # DELETE /discapacities/1.json
  def destroy
    @discapacity = Discapacity.find(params[:id])
    @discapacity.destroy

    respond_to do |format|
      format.html { redirect_to discapacities_url }
      format.json { head :no_content }
    end
  end
end
