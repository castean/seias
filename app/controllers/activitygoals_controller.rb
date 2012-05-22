class ActivitygoalsController < ApplicationController
  # GET /activitygoals
  # GET /activitygoals.json
  def index
    @activitygoals = Activitygoal.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activitygoals }
    end
  end

  # GET /activitygoals/1
  # GET /activitygoals/1.json
  def show
    @activitygoal = Activitygoal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activitygoal }
    end
  end

  # GET /activitygoals/new
  # GET /activitygoals/new.json
  def new
    @activitygoal = Activitygoal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activitygoal }
    end
  end

  # GET /activitygoals/1/edit
  def edit
    @activitygoal = Activitygoal.find(params[:id])
  end

  # POST /activitygoals
  # POST /activitygoals.json
  def create
    @activitygoal = Activitygoal.new(params[:activitygoal])

    respond_to do |format|
      if @activitygoal.save
        format.html { redirect_to @activitygoal, notice: 'Activitygoal was successfully created.' }
        format.json { render json: @activitygoal, status: :created, location: @activitygoal }
      else
        format.html { render action: "new" }
        format.json { render json: @activitygoal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activitygoals/1
  # PUT /activitygoals/1.json
  def update
    @activitygoal = Activitygoal.find(params[:id])

    respond_to do |format|
      if @activitygoal.update_attributes(params[:activitygoal])
        format.html { redirect_to @activitygoal, notice: 'Activitygoal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @activitygoal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activitygoals/1
  # DELETE /activitygoals/1.json
  def destroy
    @activitygoal = Activitygoal.find(params[:id])
    @activitygoal.destroy

    respond_to do |format|
      format.html { redirect_to activitygoals_url }
      format.json { head :no_content }
    end
  end
end
