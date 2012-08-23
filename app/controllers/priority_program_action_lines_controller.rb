#encoding:utf-8
class PriorityProgramActionLinesController < ApplicationController
  load_and_authorize_resource
  # GET /priority_program_action_lines
  # GET /priority_program_action_lines.json
  def index
    @priority_program_action_lines = PriorityProgramActionLine.order("hierarchy").all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @priority_program_action_lines }
    end
  end

  # GET /priority_program_action_lines/1
  # GET /priority_program_action_lines/1.json
  def show
    @priority_program_action_line = PriorityProgramActionLine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @priority_program_action_line }
    end
  end

  # GET /priority_program_action_lines/new
  # GET /priority_program_action_lines/new.json
  def new
    @priority_program_action_line = PriorityProgramActionLine.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @priority_program_action_line }
    end
  end

  # GET /priority_program_action_lines/1/edit
  def edit
    @priority_program_action_line = PriorityProgramActionLine.find(params[:id])
  end

  # POST /priority_program_action_lines
  # POST /priority_program_action_lines.json
  def create
    @priority_program_action_line = PriorityProgramActionLine.new(params[:priority_program_action_line])
    #<rck> Ing. César Reyes  - Actualiza en Automatico la Jerarquia
      sql = ActiveRecord::Base.connection()
      sql.begin_db_transaction
      hierarchy = "update priority_program_action_lines
                      set hierarchy = hierarchy + 1
                    where hierarchy >= #{params[:priority_program_action_line][:hierarchy]}"
       sql.update hierarchy        
    #</rck>
  
    respond_to do |format|
      if @priority_program_action_line.save
        sql.commit_db_transaction
        format.html { redirect_to @priority_program_action_line, notice: 'Priority program action line was successfully created.' }
        format.json { render json: @priority_program_action_line, status: :created, location: @priority_program_action_line }
      else
        sql.rollback_db_transaction
        format.html { render action: "new" }
        format.json { render json: @priority_program_action_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /priority_program_action_lines/1
  # PUT /priority_program_action_lines/1.json
  def update
    @priority_program_action_line = PriorityProgramActionLine.find(params[:id])

    respond_to do |format|
      if @priority_program_action_line.update_attributes(params[:priority_program_action_line])
        format.html { redirect_to @priority_program_action_line, notice: 'Priority program action line was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @priority_program_action_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /priority_program_action_lines/1
  # DELETE /priority_program_action_lines/1.json
  def destroy
    @priority_program_action_line = PriorityProgramActionLine.find(params[:id])
    #<rck> Ing. César Reyes  - Actualiza en Automatico la Jerarquia
      sql = ActiveRecord::Base.connection()
      sql.begin_db_transaction
      hierarchy = "update priority_program_action_lines
                      set hierarchy = hierarchy - 1
                    where hierarchy > #{@priority_program_action_line.hierarchy}"
       sql.update hierarchy
       sql.commit_db_transaction        
    #</rck>
    @priority_program_action_line.destroy

    respond_to do |format|
      format.html { redirect_to priority_program_action_lines_url }
      format.json { head :no_content }
    end
  end

  # GET /priority_program_action_lines
  # GET /priority_program_action_lines.json
  def report
    @priority_program_action_lines = PriorityProgramActionLine.order("hierarchy").all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @priority_program_action_lines }
    end
  end

end
