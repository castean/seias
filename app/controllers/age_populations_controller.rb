class AgePopulationsController < ApplicationController
  # GET /age_populations
  # GET /age_populations.json
  def index
    @age_populations = AgePopulation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @age_populations }
    end
  end

  # GET /age_populations/1
  # GET /age_populations/1.json
  def show
    @age_population = AgePopulation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @age_population }
    end
  end

  # GET /age_populations/new
  # GET /age_populations/new.json
  def new
    @age_population = AgePopulation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @age_population }
    end
  end

  # GET /age_populations/1/edit
  def edit
    @age_population = AgePopulation.find(params[:id])
  end

  # POST /age_populations
  # POST /age_populations.json
  def create
    @age_population = AgePopulation.new(params[:age_population])

    respond_to do |format|
      if @age_population.save
        format.html { redirect_to @age_population, notice: 'Age population was successfully created.' }
        format.json { render json: @age_population, status: :created, location: @age_population }
      else
        format.html { render action: "new" }
        format.json { render json: @age_population.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /age_populations/1
  # PUT /age_populations/1.json
  def update
    @age_population = AgePopulation.find(params[:id])

    respond_to do |format|
      if @age_population.update_attributes(params[:age_population])
        format.html { redirect_to @age_population, notice: 'Age population was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @age_population.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /age_populations/1
  # DELETE /age_populations/1.json
  def destroy
    @age_population = AgePopulation.find(params[:id])
    @age_population.destroy

    respond_to do |format|
      format.html { redirect_to age_populations_url }
      format.json { head :no_content }
    end
  end
end
