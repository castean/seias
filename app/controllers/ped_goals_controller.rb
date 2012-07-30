#encoding:utf-8
class PedGoalsController < ApplicationController
  load_and_authorize_resource
  # GET /ped_goals
  # GET /ped_goals.json
  def index
    @ped_goals = PedGoal.order("hierarchy").all

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
    #<rck> Ing. César Reyes  - Actualiza en Automatico la Jerarquia
      sql = ActiveRecord::Base.connection()
      sql.begin_db_transaction
      hierarchy = "update ped_goals
                      set hierarchy = hierarchy + 1
                    where hierarchy >= #{params[:ped_goal][:hierarchy]}"
       sql.update hierarchy        
    #</rck>
    respond_to do |format|
      if @ped_goal.save
        sql.commit_db_transaction
        format.html { redirect_to @ped_goal, notice: 'Ped goal was successfully created.' }
        format.json { render json: @ped_goal, status: :created, location: @ped_goal }
      else
        sql.rollback_db_transaction
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
    #<rck> Ing. César Reyes  - Actualiza en Automatico la Jerarquia
      sql = ActiveRecord::Base.connection()
      sql.begin_db_transaction
      hierarchy = "update ped_goals
                      set hierarchy = hierarchy - 1
                    where hierarchy > #{@ped_goal.hierarchy}"
       sql.update hierarchy
       sql.commit_db_transaction        
    #</rck>
    @ped_goal.destroy

    respond_to do |format|
      format.html { redirect_to ped_goals_url }
      format.json { head :no_content }
    end
  end
end
