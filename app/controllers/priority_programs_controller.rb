class PriorityProgramsController < ApplicationController
  # GET /priority_programs
  # GET /priority_programs.json
  def index
    @priority_programs = PriorityProgram.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @priority_programs }
    end
  end

  # GET /priority_programs/1
  # GET /priority_programs/1.json
  def show
    @priority_program = PriorityProgram.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @priority_program }
    end
  end

  # GET /priority_programs/new
  # GET /priority_programs/new.json
  def new
    @priority_program = PriorityProgram.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @priority_program }
    end
  end

  # GET /priority_programs/1/edit
  def edit
    @priority_program = PriorityProgram.find(params[:id])
  end

  # POST /priority_programs
  # POST /priority_programs.json
  def create
    @priority_program = PriorityProgram.new(params[:priority_program])

    respond_to do |format|
      if @priority_program.save
        format.html { redirect_to @priority_program, notice: 'Priority program was successfully created.' }
        format.json { render json: @priority_program, status: :created, location: @priority_program }
      else
        format.html { render action: "new" }
        format.json { render json: @priority_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /priority_programs/1
  # PUT /priority_programs/1.json
  def update
    @priority_program = PriorityProgram.find(params[:id])

    respond_to do |format|
      if @priority_program.update_attributes(params[:priority_program])
        format.html { redirect_to @priority_program, notice: 'Priority program was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @priority_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /priority_programs/1
  # DELETE /priority_programs/1.json
  def destroy
    @priority_program = PriorityProgram.find(params[:id])
    @priority_program.destroy

    respond_to do |format|
      format.html { redirect_to priority_programs_url }
      format.json { head :no_content }
    end
  end
end
