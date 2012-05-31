class StatisticalMapsController < ApplicationController
  # GET /statistical_maps
  # GET /statistical_maps.json
  def index
    
  end

  # GET /statistical_maps/1
  # GET /statistical_maps/1.json
  def show
    @statistical_map = StatisticalMap.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @statistical_map }
    end
  end

  # GET /statistical_maps/new
  # GET /statistical_maps/new.json
  def new
    @statistical_map = StatisticalMap.new
    @json = Town.find_all_by_state_id_and_cve_loc(8,1).to_gmaps4rails   
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @statistical_map }
    end
  end

  # GET /statistical_maps/1/edit
  def edit
    @statistical_map = StatisticalMap.find(params[:id])
  end

  # POST /statistical_maps
  # POST /statistical_maps.json
  def create
    @statistical_map = StatisticalMap.new(params[:statistical_map])

    respond_to do |format|
      if @statistical_map.save
        format.html { redirect_to @statistical_map, notice: 'Statistical map was successfully created.' }
        format.json { render json: @statistical_map, status: :created, location: @statistical_map }
      else
        format.html { render action: "new" }
        format.json { render json: @statistical_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /statistical_maps/1
  # PUT /statistical_maps/1.json
  def update
    @statistical_map = StatisticalMap.find(params[:id])

    respond_to do |format|
      if @statistical_map.update_attributes(params[:statistical_map])
        format.html { redirect_to @statistical_map, notice: 'Statistical map was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @statistical_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statistical_maps/1
  # DELETE /statistical_maps/1.json
  def destroy
    @statistical_map = StatisticalMap.find(params[:id])
    @statistical_map.destroy

    respond_to do |format|
      format.html { redirect_to statistical_maps_url }
      format.json { head :no_content }
    end
  end
end
