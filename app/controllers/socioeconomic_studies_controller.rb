class SocioeconomicStudiesController < ApplicationController
  load_and_authorize_resource
  # GET /socioeconomic_studies
  # GET /socioeconomic_studies.json
  def index
    @socioeconomic_studies = SocioeconomicStudy.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @socioeconomic_studies }
    end
  end

  # GET /socioeconomic_studies/1
  # GET /socioeconomic_studies/1.json
  def show
    @socioeconomic_study = SocioeconomicStudy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb


      format.json { render json: @socioeconomic_study }
    end
  end

  # GET /socioeconomic_studies/new
  # GET /socioeconomic_studies/new.json
  def new
    @socioeconomic_study = SocioeconomicStudy.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @socioeconomic_study }
    end
  end

  # GET /socioeconomic_studies/1/edit
  def edit
    @socioeconomic_study = SocioeconomicStudy.find(params[:id])
  end

  # POST /socioeconomic_studies
  # POST /socioeconomic_studies.json
  def create
    @socioeconomic_study = SocioeconomicStudy.new(params[:socioeconomic_study])

    respond_to do |format|
      if @socioeconomic_study.save
        format.html { redirect_to @socioeconomic_study, notice: 'Socioeconomic study was successfully created.' }
        format.json { render json: @socioeconomic_study, status: :created, location: @socioeconomic_study }
      else
        format.html { render action: "new" }
        format.json { render json: @socioeconomic_study.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /socioeconomic_studies/1
  # PUT /socioeconomic_studies/1.json
  def update
    @socioeconomic_study = SocioeconomicStudy.find(params[:id])

    respond_to do |format|
      if @socioeconomic_study.update_attributes(params[:socioeconomic_study])
        format.html { redirect_to @socioeconomic_study, notice: 'Socioeconomic study was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @socioeconomic_study.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /socioeconomic_studies/1
  # DELETE /socioeconomic_studies/1.json
  def destroy
    @socioeconomic_study = SocioeconomicStudy.find(params[:id])
    @socioeconomic_study.destroy

    respond_to do |format|
      format.html { redirect_to socioeconomic_studies_url }
      format.json { head :no_content }
    end
  end
end
