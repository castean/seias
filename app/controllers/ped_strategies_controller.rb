#encoding:utf-8
class PedStrategiesController < ApplicationController
  load_and_authorize_resource
  # GET /ped_strategies
  # GET /ped_strategies.json
  def index
    @ped_strategies = PedStrategy.order("hierarchy").all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ped_strategies }
    end
  end

  # GET /ped_strategies/1
  # GET /ped_strategies/1.json
  def show
    @ped_strategy = PedStrategy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ped_strategy }
    end
  end

  # GET /ped_strategies/new
  # GET /ped_strategies/new.json
  def new
    @ped_strategy = PedStrategy.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ped_strategy }
    end
  end

  # GET /ped_strategies/1/edit
  def edit
    @ped_strategy = PedStrategy.find(params[:id])
  end

  # POST /ped_strategies
  # POST /ped_strategies.json
  def create
    @ped_strategy = PedStrategy.new(params[:ped_strategy])
    #<rck> Ing. César Reyes  - Actualiza en Automatico la Jerarquia
      sql = ActiveRecord::Base.connection()
      sql.begin_db_transaction
      hierarchy = "update ped_strategies
                      set hierarchy = hierarchy + 1
                    where hierarchy >= #{params[:ped_strategy][:hierarchy]}"
       sql.update hierarchy        
    #</rck>
    respond_to do |format|
      if @ped_strategy.save
        sql.commit_db_transaction
        format.html { redirect_to @ped_strategy, notice: 'Ped strategy was successfully created.' }
        format.json { render json: @ped_strategy, status: :created, location: @ped_strategy }
      else
        sql.rollback_db_transaction
        format.html { render action: "new" }
        format.json { render json: @ped_strategy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ped_strategies/1
  # PUT /ped_strategies/1.json
  def update
    @ped_strategy = PedStrategy.find(params[:id])

    respond_to do |format|
      if @ped_strategy.update_attributes(params[:ped_strategy])
        format.html { redirect_to @ped_strategy, notice: 'Ped strategy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ped_strategy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ped_strategies/1
  # DELETE /ped_strategies/1.json
  def destroy
    @ped_strategy = PedStrategy.find(params[:id])
    #<rck> Ing. César Reyes  - Actualiza en Automatico la Jerarquia
      sql = ActiveRecord::Base.connection()
      sql.begin_db_transaction
      hierarchy = "update ped_strategies
                      set hierarchy = hierarchy - 1
                    where hierarchy > #{@ped_strategy.hierarchy}"
       sql.update hierarchy
       sql.commit_db_transaction        
    #</rck>
    @ped_strategy.destroy

    respond_to do |format|
      format.html { redirect_to ped_strategies_url }
      format.json { head :no_content }
    end
  end
end
