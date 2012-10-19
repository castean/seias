class SchoolAgesController < ApplicationController
  # GET /school_ages
  # GET /school_ages.json
  def index
    @school_ages = SchoolAge.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @school_ages }
    end
  end

  # GET /school_ages/1
  # GET /school_ages/1.json
  def show
    @school_age = SchoolAge.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @school_age }
    end
  end

  # GET /school_ages/new
  # GET /school_ages/new.json
  def new
    @school_age = SchoolAge.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @school_age }
    end
  end

  # GET /school_ages/1/edit
  def edit
    @school_age = SchoolAge.find(params[:id])
  end

  # POST /school_ages
  # POST /school_ages.json
  def create
    @school_age = SchoolAge.new(params[:school_age])

    respond_to do |format|
      if @school_age.save
        format.html { redirect_to @school_age, notice: 'School age was successfully created.' }
        format.json { render json: @school_age, status: :created, location: @school_age }
      else
        format.html { render action: "new" }
        format.json { render json: @school_age.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /school_ages/1
  # PUT /school_ages/1.json
  def update
    @school_age = SchoolAge.find(params[:id])

    respond_to do |format|
      if @school_age.update_attributes(params[:school_age])
        format.html { redirect_to @school_age, notice: 'School age was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @school_age.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_ages/1
  # DELETE /school_ages/1.json
  def destroy
    @school_age = SchoolAge.find(params[:id])
    @school_age.destroy

    respond_to do |format|
      format.html { redirect_to school_ages_url }
      format.json { head :no_content }
    end
  end
end
