class CriticalSuccessFactorsController < ApplicationController
  load_and_authorize_resource
  # GET /critical_success_factors
  # GET /critical_success_factors.json
  def index
    @critical_success_factors = CriticalSuccessFactor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @critical_success_factors }
    end
  end

  # GET /critical_success_factors/1
  # GET /critical_success_factors/1.json
  def show
    @critical_success_factor = CriticalSuccessFactor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @critical_success_factor }
    end
  end

  # GET /critical_success_factors/new
  # GET /critical_success_factors/new.json
  def new
    @critical_success_factor = CriticalSuccessFactor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @critical_success_factor }
    end
  end

  # GET /critical_success_factors/1/edit
  def edit
    @critical_success_factor = CriticalSuccessFactor.find(params[:id])
  end

  # POST /critical_success_factors
  # POST /critical_success_factors.json
  def create
    @critical_success_factor = CriticalSuccessFactor.new(params[:critical_success_factor])
    @critical_success_factor.user = current_user
    @critical_success_factor.confidential = false

    respond_to do |format|
      if @critical_success_factor.save
        format.html { redirect_to @critical_success_factor, notice: 'Critical success factor was successfully created.' }
        format.json { render json: @critical_success_factor, status: :created, location: @critical_success_factor }
      else
        format.html { render action: "new" }
        format.json { render json: @critical_success_factor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /critical_success_factors/1
  # PUT /critical_success_factors/1.json
  def update
    @critical_success_factor = CriticalSuccessFactor.find(params[:id])

    respond_to do |format|
      if @critical_success_factor.update_attributes(params[:critical_success_factor])
        format.html { redirect_to @critical_success_factor, notice: 'Critical success factor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @critical_success_factor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /critical_success_factors/1
  # DELETE /critical_success_factors/1.json
  def destroy
    @critical_success_factor = CriticalSuccessFactor.find(params[:id])
    @critical_success_factor.destroy

    respond_to do |format|
      format.html { redirect_to critical_success_factors_url }
      format.json { head :no_content }
    end
  end
end
