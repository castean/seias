class PedProgramDefinitionsController < ApplicationController
  # GET /ped_program_definitions
  # GET /ped_program_definitions.json
  def index
    @ped_program_definitions = PedProgramDefinition.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ped_program_definitions }
    end
  end

  # GET /ped_program_definitions/1
  # GET /ped_program_definitions/1.json
  def show
    @ped_program_definition = PedProgramDefinition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ped_program_definition }
    end
  end

  # GET /ped_program_definitions/new
  # GET /ped_program_definitions/new.json
  def new
    @ped_program_definition = PedProgramDefinition.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ped_program_definition }
    end
  end

  # GET /ped_program_definitions/1/edit
  def edit
    @ped_program_definition = PedProgramDefinition.find(params[:id])
  end

  # POST /ped_program_definitions
  # POST /ped_program_definitions.json
  def create
    @ped_program_definition = PedProgramDefinition.new(params[:ped_program_definition])

    respond_to do |format|
      if @ped_program_definition.save
        format.html { redirect_to @ped_program_definition, notice: 'Ped program definition was successfully created.' }
        format.json { render json: @ped_program_definition, status: :created, location: @ped_program_definition }
      else
        format.html { render action: "new" }
        format.json { render json: @ped_program_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ped_program_definitions/1
  # PUT /ped_program_definitions/1.json
  def update
    @ped_program_definition = PedProgramDefinition.find(params[:id])

    respond_to do |format|
      if @ped_program_definition.update_attributes(params[:ped_program_definition])
        format.html { redirect_to @ped_program_definition, notice: 'Ped program definition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ped_program_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ped_program_definitions/1
  # DELETE /ped_program_definitions/1.json
  def destroy
    @ped_program_definition = PedProgramDefinition.find(params[:id])
    @ped_program_definition.destroy

    respond_to do |format|
      format.html { redirect_to ped_program_definitions_url }
      format.json { head :no_content }
    end
  end
end
