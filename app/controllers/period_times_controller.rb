class PeriodTimesController < ApplicationController
  # GET /period_times
  # GET /period_times.json
  def index
    @period_times = PeriodTime.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @period_times }
    end
  end

  # GET /period_times/1
  # GET /period_times/1.json
  def show
    @period_time = PeriodTime.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @period_time }
    end
  end

  # GET /period_times/new
  # GET /period_times/new.json
  def new
    @period_time = PeriodTime.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @period_time }
    end
  end

  # GET /period_times/1/edit
  def edit
    @period_time = PeriodTime.find(params[:id])
  end

  # POST /period_times
  # POST /period_times.json
  def create
    @period_time = PeriodTime.new(params[:period_time])

    respond_to do |format|
      if @period_time.save
        format.html { redirect_to @period_time, notice: 'Period time was successfully created.' }
        format.json { render json: @period_time, status: :created, location: @period_time }
      else
        format.html { render action: "new" }
        format.json { render json: @period_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /period_times/1
  # PUT /period_times/1.json
  def update
    @period_time = PeriodTime.find(params[:id])

    respond_to do |format|
      if @period_time.update_attributes(params[:period_time])
        format.html { redirect_to @period_time, notice: 'Period time was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @period_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /period_times/1
  # DELETE /period_times/1.json
  def destroy
    @period_time = PeriodTime.find(params[:id])
    @period_time.destroy

    respond_to do |format|
      format.html { redirect_to period_times_url }
      format.json { head :no_content }
    end
  end
end
