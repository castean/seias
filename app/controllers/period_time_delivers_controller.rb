class PeriodTimeDeliversController < ApplicationController
  # GET /period_time_delivers
  # GET /period_time_delivers.json
  def index
    @period_time_delivers = PeriodTimeDeliver.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @period_time_delivers }
    end
  end

  # GET /period_time_delivers/1
  # GET /period_time_delivers/1.json
  def show
    @period_time_deliver = PeriodTimeDeliver.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @period_time_deliver }
    end
  end

  # GET /period_time_delivers/new
  # GET /period_time_delivers/new.json
  def new
    @period_time_deliver = PeriodTimeDeliver.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @period_time_deliver }
    end
  end

  # GET /period_time_delivers/1/edit
  def edit
    @period_time_deliver = PeriodTimeDeliver.find(params[:id])
  end

  # POST /period_time_delivers
  # POST /period_time_delivers.json
  def create
    @period_time_deliver = PeriodTimeDeliver.new(params[:period_time_deliver])

    respond_to do |format|
      if @period_time_deliver.save
        format.html { redirect_to @period_time_deliver, notice: 'Period time deliver was successfully created.' }
        format.json { render json: @period_time_deliver, status: :created, location: @period_time_deliver }
      else
        format.html { render action: "new" }
        format.json { render json: @period_time_deliver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /period_time_delivers/1
  # PUT /period_time_delivers/1.json
  def update
    @period_time_deliver = PeriodTimeDeliver.find(params[:id])

    respond_to do |format|
      if @period_time_deliver.update_attributes(params[:period_time_deliver])
        format.html { redirect_to @period_time_deliver, notice: 'Period time deliver was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @period_time_deliver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /period_time_delivers/1
  # DELETE /period_time_delivers/1.json
  def destroy
    @period_time_deliver = PeriodTimeDeliver.find(params[:id])
    @period_time_deliver.destroy

    respond_to do |format|
      format.html { redirect_to period_time_delivers_url }
      format.json { head :no_content }
    end
  end
end
