class PedAxisDevelopmentsController < ApplicationController
  load_and_authorize_resource
  # GET /ped_axis_developments
  # GET /ped_axis_developments.json
  def index
    @ped_axis_developments = PedAxisDevelopment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ped_axis_developments }
    end
  end

  # GET /ped_axis_developments/1
  # GET /ped_axis_developments/1.json
  def show
    @ped_axis_development = PedAxisDevelopment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ped_axis_development }
    end
  end

  # GET /ped_axis_developments/new
  # GET /ped_axis_developments/new.json
  def new
    @ped_axis_development = PedAxisDevelopment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ped_axis_development }
    end
  end

  # GET /ped_axis_developments/1/edit
  def edit
    @ped_axis_development = PedAxisDevelopment.find(params[:id])
  end

  # POST /ped_axis_developments
  # POST /ped_axis_developments.json
  def create
    @ped_axis_development = PedAxisDevelopment.new(params[:ped_axis_development])

    respond_to do |format|
      if @ped_axis_development.save
        format.html { redirect_to @ped_axis_development, notice: 'Ped axis development was successfully created.' }
        format.json { render json: @ped_axis_development, status: :created, location: @ped_axis_development }
      else
        format.html { render action: "new" }
        format.json { render json: @ped_axis_development.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ped_axis_developments/1
  # PUT /ped_axis_developments/1.json
  def update
    @ped_axis_development = PedAxisDevelopment.find(params[:id])

    respond_to do |format|
      if @ped_axis_development.update_attributes(params[:ped_axis_development])
        format.html { redirect_to @ped_axis_development, notice: 'Ped axis development was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ped_axis_development.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ped_axis_developments/1
  # DELETE /ped_axis_developments/1.json
  def destroy
    @ped_axis_development = PedAxisDevelopment.find(params[:id])
    @ped_axis_development.destroy

    respond_to do |format|
      format.html { redirect_to ped_axis_developments_url }
      format.json { head :no_content }
    end
  end
end
