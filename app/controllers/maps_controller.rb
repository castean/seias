#encoding:utf-8
class MapsController < ApplicationController
  load_and_authorize_resource
  def index
    #@state = 8
    #@cveloc = 1
    
      @county=8
      @town=1
      @placetype=1
    
    @map = Town.find_all_by_state_id_and_cve_loc(@county,@town)
    @json = Town.find_all_by_state_id_and_cve_loc(@county,@town).to_gmaps4rails
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @map }
    end   
  end

  def get_map
    @state = 8
    #@cveloc = 1
    @county=params[:formulario][:county_id]
    @town=params[:formulario][:town_id]
    @placetype=params[:formulario][:institution_type_id]
    
    #@map = Town.find_all_by_state_id_and_county_id(@state,@county)
    #@json = Town.find_all_by_state_id_and_county_id(@state,@county).to_gmaps4rails
    @map = Place.find_all_by_town_id_and_place_type_id(@town,@placetype)
    @json = Place.find_all_by_town_id_and_place_type_id(@town,@placetype).to_gmaps4rails
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @map }
    end 
  end
end
