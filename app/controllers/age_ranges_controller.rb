class AgeRangesController < ApplicationController
  load_and_authorize_resource
  # GET /age_ranges
  # GET /age_ranges.json
  def index
    @age_ranges = AgeRange.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @age_ranges }
    end
  end

  # GET /age_ranges/1
  # GET /age_ranges/1.json
  def show
    @age_range = AgeRange.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @age_range }
    end
  end

  # GET /age_ranges/new
  # GET /age_ranges/new.json
  def new
    @age_range = AgeRange.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @age_range }
    end
  end

  # GET /age_ranges/1/edit
  def edit
    @age_range = AgeRange.find(params[:id])
  end

  # POST /age_ranges
  # POST /age_ranges.json
  def create
    @age_range = AgeRange.new(params[:age_range])

    respond_to do |format|
      if @age_range.save
        format.html { redirect_to @age_range, notice: 'Age range was successfully created.' }
        format.json { render json: @age_range, status: :created, location: @age_range }
      else
        format.html { render action: "new" }
        format.json { render json: @age_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /age_ranges/1
  # PUT /age_ranges/1.json
  def update
    @age_range = AgeRange.find(params[:id])

    respond_to do |format|
      if @age_range.update_attributes(params[:age_range])
        format.html { redirect_to @age_range, notice: 'Age range was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @age_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /age_ranges/1
  # DELETE /age_ranges/1.json
  def destroy
    @age_range = AgeRange.find(params[:id])
    @age_range.destroy

    respond_to do |format|
      format.html { redirect_to age_ranges_url }
      format.json { head :no_content }
    end
  end
end
