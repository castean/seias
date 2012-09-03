#encoding:utf-8
class PriorityProgramStrategiesController < ApplicationController
  load_and_authorize_resource
  # GET /priority_program_strategies
  # GET /priority_program_strategies.json
  def index
    @priority_program_strategies = PriorityProgramStrategy.order("hierarchy").all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @priority_program_strategies }
    end
  end

  # GET /priority_program_strategies/1
  # GET /priority_program_strategies/1.json
  def show
    @priority_program_strategy = PriorityProgramStrategy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @priority_program_strategy }
    end
  end

  # GET /priority_program_strategies/new
  # GET /priority_program_strategies/new.json
  def new
    @priority_program_strategy = PriorityProgramStrategy.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @priority_program_strategy }
    end
  end

  # GET /priority_program_strategies/1/edit
  def edit
    @priority_program_strategy = PriorityProgramStrategy.find(params[:id])
  end

  # POST /priority_program_strategies
  # POST /priority_program_strategies.json
  def create
    @priority_program_strategy = PriorityProgramStrategy.new(params[:priority_program_strategy])
    #<rck> Ing. César Reyes  - Actualiza en Automatico la Jerarquia
      sql = ActiveRecord::Base.connection()
      sql.begin_db_transaction
      hierarchy = "update priority_program_strategies
                      set hierarchy = hierarchy + 1
                    where hierarchy >= #{params[:priority_program_strategy][:hierarchy]}"
       sql.update hierarchy        
    #</rck>
        
    respond_to do |format|
      if @priority_program_strategy.save
        sql.commit_db_transaction
        format.html { redirect_to @priority_program_strategy, notice: 'Priority program strategy was successfully created.' }
        format.json { render json: @priority_program_strategy, status: :created, location: @priority_program_strategy }
      else
        sql.rollback_db_transaction
        format.html { render action: "new" }
        format.json { render json: @priority_program_strategy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /priority_program_strategies/1
  # PUT /priority_program_strategies/1.json
  def update
    @priority_program_strategy = PriorityProgramStrategy.find(params[:id])

    respond_to do |format|
      if @priority_program_strategy.update_attributes(params[:priority_program_strategy])
        format.html { redirect_to @priority_program_strategy, notice: 'Priority program strategy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @priority_program_strategy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /priority_program_strategies/1
  # DELETE /priority_program_strategies/1.json
  def destroy
    @priority_program_strategy = PriorityProgramStrategy.find(params[:id])
    #<rck> Ing. César Reyes  - Actualiza en Automatico la Jerarquia
      sql = ActiveRecord::Base.connection()
      sql.begin_db_transaction
      hierarchy = "update priority_program_strategies
                      set hierarchy = hierarchy - 1
                    where hierarchy > #{@priority_program_strategy.hierarchy}"
       sql.update hierarchy
       sql.commit_db_transaction        
    #</rck>
    @priority_program_strategy.destroy

    respond_to do |format|
      format.html { redirect_to priority_program_strategies_url }
      format.json { head :no_content }
    end
  end
end
