class PedProgramsController < ApplicationController
  load_and_authorize_resource
  # GET /ped_programs
  # GET /ped_programs.json
  def index
    @ped_programs = PedProgram.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ped_programs }
    end
  end

  # GET /ped_programs/1
  # GET /ped_programs/1.json
  def show
    @ped_program = PedProgram.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ped_program }
    end
  end

  # GET /ped_programs/new
  # GET /ped_programs/new.json
  def new
    @ped_program = PedProgram.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ped_program }
    end
  end

  # GET /ped_programs/1/edit
  def edit
    @ped_program = PedProgram.find(params[:id])
  end

  # POST /ped_programs
  # POST /ped_programs.json
  def create
    @ped_program = PedProgram.new(params[:ped_program])

    respond_to do |format|
      if @ped_program.save
        format.html { redirect_to @ped_program, notice: 'Ped program was successfully created.' }
        format.json { render json: @ped_program, status: :created, location: @ped_program }
      else
        format.html { render action: "new" }
        format.json { render json: @ped_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ped_programs/1
  # PUT /ped_programs/1.json
  def update
    @ped_program = PedProgram.find(params[:id])

    respond_to do |format|
      if @ped_program.update_attributes(params[:ped_program])
        format.html { redirect_to @ped_program, notice: 'Ped program was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ped_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ped_programs/1
  # DELETE /ped_programs/1.json
  def destroy
    @ped_program = PedProgram.find(params[:id])
    @ped_program.destroy

    respond_to do |format|
      format.html { redirect_to ped_programs_url }
      format.json { head :no_content }
    end
  end
end
