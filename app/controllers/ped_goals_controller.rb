class PedGoalsController < ApplicationController
  # GET /ped_goals
  # GET /ped_goals.json
  def index
    @ped_goals = PedGoal.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ped_goals }
    end
  end

  # GET /ped_goals/1
  # GET /ped_goals/1.json
  def show
    @ped_goal = PedGoal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ped_goal }
    end
  end

  # GET /ped_goals/new
  # GET /ped_goals/new.json
  def new
    @ped_goal = PedGoal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ped_goal }
    end
  end

  # GET /ped_goals/1/edit
  def edit
    @ped_goal = PedGoal.find(params[:id])
  end

  # POST /ped_goals
  # POST /ped_goals.json
  def create
    @ped_goal = PedGoal.new(params[:ped_goal])

    respond_to do |format|
      if @ped_goal.save
        format.html { redirect_to @ped_goal, notice: 'Ped goal was successfully created.' }
        format.json { render json: @ped_goal, status: :created, location: @ped_goal }
      else
        format.html { render action: "new" }
        format.json { render json: @ped_goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ped_goals/1
  # PUT /ped_goals/1.json
  def update
    @ped_goal = PedGoal.find(params[:id])

    respond_to do |format|
      if @ped_goal.update_attributes(params[:ped_goal])
        format.html { redirect_to @ped_goal, notice: 'Ped goal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ped_goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ped_goals/1
  # DELETE /ped_goals/1.json
  def destroy
    @ped_goal = PedGoal.find(params[:id])
    @ped_goal.destroy

    respond_to do |format|
      format.html { redirect_to ped_goals_url }
      format.json { head :no_content }
    end
  end
end
