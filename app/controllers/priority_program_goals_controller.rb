class PriorityProgramGoalsController < ApplicationController
  # GET /priority_program_goals
  # GET /priority_program_goals.json
  def index
    @priority_program_goals = PriorityProgramGoal.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @priority_program_goals }
    end
  end

  # GET /priority_program_goals/1
  # GET /priority_program_goals/1.json
  def show
    @priority_program_goal = PriorityProgramGoal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @priority_program_goal }
    end
  end

  # GET /priority_program_goals/new
  # GET /priority_program_goals/new.json
  def new
    @priority_program_goal = PriorityProgramGoal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @priority_program_goal }
    end
  end

  # GET /priority_program_goals/1/edit
  def edit
    @priority_program_goal = PriorityProgramGoal.find(params[:id])
  end

  # POST /priority_program_goals
  # POST /priority_program_goals.json
  def create
    @priority_program_goal = PriorityProgramGoal.new(params[:priority_program_goal])

    respond_to do |format|
      if @priority_program_goal.save
        format.html { redirect_to @priority_program_goal, notice: 'Priority program goal was successfully created.' }
        format.json { render json: @priority_program_goal, status: :created, location: @priority_program_goal }
      else
        format.html { render action: "new" }
        format.json { render json: @priority_program_goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /priority_program_goals/1
  # PUT /priority_program_goals/1.json
  def update
    @priority_program_goal = PriorityProgramGoal.find(params[:id])

    respond_to do |format|
      if @priority_program_goal.update_attributes(params[:priority_program_goal])
        format.html { redirect_to @priority_program_goal, notice: 'Priority program goal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @priority_program_goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /priority_program_goals/1
  # DELETE /priority_program_goals/1.json
  def destroy
    @priority_program_goal = PriorityProgramGoal.find(params[:id])
    @priority_program_goal.destroy

    respond_to do |format|
      format.html { redirect_to priority_program_goals_url }
      format.json { head :no_content }
    end
  end
end
