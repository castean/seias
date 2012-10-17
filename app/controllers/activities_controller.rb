#encoding:utf-8
class ActivitiesController < ApplicationController
  load_and_authorize_resource
  # GET /activities
  # GET /activities.json
  def index
    #current_user = UserSession.find
    #id = current_user && current_user.record.id
    #@activities = Activity.where("user_id = #{ id }")
    
    @activities = Activity.where(:user_id => current_user).order("id DESC").page(params[:page]).per(25)
    #@activities = Activity.order("description").page(params[:page]).per(25)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activities }
    end
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
    @activity = Activity.find(params[:id])
    @json = Town.find(@activity.town).to_gmaps4rails

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activity }
    end
  end

  # GET /activities/new
  # GET /activities/new.json
  def new
    current_user = UserSession.find
    id = current_user && current_user.record.id
    @activity = Activity.new(:user_id => id)

    if params[:continuos] == '1' 
      
      @activity = Activity.where(:user_id => id).last.dup
      
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @activity }
        
      end
    else
     respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @activity }
      end   
    end    
  end

  # GET /activities/1/edit
  def edit
    @activity = Activity.find(params[:id])
  end

  # POST /activities
  # POST /activities.json
  def create
  
    @activity = Activity.new(params[:activity])

    respond_to do |format|
        if @activity.save
        
            #format.html { redirect_to @activity, notice: 'Activity was successfully created.' }new_activity_path
            #format.json { render json: @activity, status: :created, location: @activity }
            
            flash[:notice] = 'La actividad se dio de alta satisfactoriamente.' #+ current_user.id.to_s
         
            format.html { redirect_to(:action => 'new', :continuos => 1 ) }
          else
            format.html { render action: "new" }
            format.json { render json: @activity.errors, status: :unprocessable_entity }
          end

    end
  end

  # PUT /activities/1
  # PUT /activities/1.json
  def update
    @activity = Activity.find(params[:id])

    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to activities_url }
      format.json { head :no_content }
    end
  end
  # ISC Christian Ivan Alderete Garcia funcion para cambiar valores con CoffeScript y json
  def for_activitytypeid
    @activity_types = ActivityType.includes(:unit_of_measurement).where(:id => params[:activity_type_id])
    
    respond_to do |format|
      format.json  { render :json => @activity_types.to_json(:include => :unit_of_measurement)}      
    end
  end
  # Ing. César Reyes # Carga Valores de Activity_Types con CoffeScript y json
  def for_programid

    sql = "Select distinct activity_types.name, activity_types.id from activity_types INNER JOIN activity_types_critical_success_factors ON activity_types_critical_success_factors.activity_type_id = activity_types.id
                      INNER JOIN critical_success_factors ON critical_success_factors.id = activity_types_critical_success_factors.critical_success_factor_id
                      INNER JOIN Programs ON programs.id = critical_success_factors.program_id INNER JOIN directions ON directions.id = programs.direction_id
                      WHERE programs.id = #{params[:program_id]} order by activity_types.name"
    @filter_activity_types = ActiveRecord::Base.connection.select_rows(sql)
    @filter_activity_types.map{|name, id|}
    respond_to do |format|
      format.json  { render :json => @filter_activity_types}
    end
  end
end