class StatisticalMapsController < ApplicationController
  load_and_authorize_resource
  # GET /statistical_maps
  # GET /statistical_maps.json
  def index
    @statistical_map = StatisticalMap.new
    @json = Town.find_all_by_state_id_and_cve_loc(8,1).to_gmaps4rails   
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @statistical_map }
    end
  end

  def get_maps_by_town
    @json = Town.where(:county_id => params[:id], :state_id => 8).to_gmaps4rails 
    @statistical_map = StatisticalMap.new()
    
      
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @statistical_map }
    end
  end

    
  # GET /statistical_maps/1
  # GET /statistical_maps/1.json
  def show
    #@state = 8
    #@cveloc = 1
    
      @county=8
      @town=1
      @placetype=1
    
    @statistical_map = StatisticalMap.first
    @json = Town.find_all_by_state_id_and_cve_loc(@county,@town).to_gmaps4rails
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @statistical_map }
    end   
  end

  def get_map
    @state = 8
    @cveloc = 1
    if params[:county_id]== ""
      @county=8
      @town=0
      @placetype=1
    else
      @county=params[:county_id]
      @town=params[:town_id]
      @placetype=params[:institution_type_id]
    end
    
    @statistical_map = StatisticalMap.first
    @json = Town.find_all_by_state_id_and_cve_loc(@state,@cveloc).to_gmaps4rails
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @statistical_map }
    end 
  end

  def update
    #@state = 8
    #@cveloc = 1
    if params[:county_id]== ""
      @county=8
      @town=0
      @placetype=1
    else
      @county=params[:county_id]
      @town=params[:town_id]
      @placetype=params[:institution_type_id]
    end
    
    @statistical_map = StatisticalMap.first
    @json = Town.find_all_by_state_id_and_cve_loc(@county,@town).to_gmaps4rails
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @statistical_map }
    end 
    
  end
end
