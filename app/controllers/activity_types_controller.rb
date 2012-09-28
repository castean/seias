#encoding:utf-8
class ActivityTypesController < ApplicationController
  load_and_authorize_resource
  # GET /activity_types
  # GET /activity_types.json
  def index
    @activity_types = ActivityType.order("name").page(params[:page]).per(30)
    #@activity_types = ActivityType.search(params[:search]).page(params[:page]).per(30)
    #@activity_types = ActivityType.search_for(params[:search], :order => params[:order]).all(:include => :name)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activity_types }
    end
  end

  # GET /activity_types/1
  # GET /activity_types/1.json
  def show
    @activity_type = ActivityType.find(params[:id]) 
    @activitypage = @activity_type.activities.page(params[:page]).per(20)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activity_type }
    end
  end

  # GET /activity_types/new
  # GET /activity_types/new.json
  def new
    current_user = UserSession.find
    id = current_user && current_user.record.id
    @activity_type = ActivityType.new(:user_id => id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activity_type }
    end
  end

  # GET /activity_types/1/edit
  def edit
    @activity_type = ActivityType.find(params[:id])
  end

  # POST /activity_types
  # POST /activity_types.json
  def create
    @activity_type = ActivityType.new(params[:activity_type])

    respond_to do |format|
      if @activity_type.save
        format.html { redirect_to @activity_type, notice: 'Activity type was successfully created.' }
        format.json { render json: @activity_type, status: :created, location: @activity_type }
      else
        format.html { render action: "new" }
        format.json { render json: @activity_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activity_types/1
  # PUT /activity_types/1.json
  def update
    @activity_type = ActivityType.find(params[:id])

    respond_to do |format|
      if @activity_type.update_attributes(params[:activity_type])
        format.html { redirect_to @activity_type, notice: 'Activity type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @activity_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_types/1
  # DELETE /activity_types/1.json
  def destroy
    @activity_type = ActivityType.find(params[:id])
    @activity_type.destroy

    respond_to do |format|
      format.html { redirect_to activity_types_url }
      format.json { head :no_content }
    end
  end

  #def auto_complete_search
   # begin
    #  @items = ActivityType.complete_for(params[:search])
    #rescue ScopedSearch::QueryNotSupported => e
     # @items = [{:error =>e.to_s}]
    #end
    #render :json => @items
  #end

  def at_search
  @at_sea = ActivityType.search_for(params[:search], :order => params[:order]).all
  rescue => e
    flash[:error] = e.to_s
    @at_sea = ActivityType.search_for ''
  end

end
