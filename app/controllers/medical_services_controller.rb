class MedicalServicesController < ApplicationController
  # GET /medical_services
  # GET /medical_services.json
  def index
    @medical_services = MedicalService.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medical_services }
    end
  end

  # GET /medical_services/1
  # GET /medical_services/1.json
  def show
    @medical_service = MedicalService.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medical_service }
    end
  end

  # GET /medical_services/new
  # GET /medical_services/new.json
  def new
    @medical_service = MedicalService.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medical_service }
    end
  end

  # GET /medical_services/1/edit
  def edit
    @medical_service = MedicalService.find(params[:id])
  end

  # POST /medical_services
  # POST /medical_services.json
  def create
    @medical_service = MedicalService.new(params[:medical_service])

    respond_to do |format|
      if @medical_service.save
        format.html { redirect_to @medical_service, notice: 'Medical service was successfully created.' }
        format.json { render json: @medical_service, status: :created, location: @medical_service }
      else
        format.html { render action: "new" }
        format.json { render json: @medical_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medical_services/1
  # PUT /medical_services/1.json
  def update
    @medical_service = MedicalService.find(params[:id])

    respond_to do |format|
      if @medical_service.update_attributes(params[:medical_service])
        format.html { redirect_to @medical_service, notice: 'Medical service was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medical_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medical_services/1
  # DELETE /medical_services/1.json
  def destroy
    @medical_service = MedicalService.find(params[:id])
    @medical_service.destroy

    respond_to do |format|
      format.html { redirect_to medical_services_url }
      format.json { head :no_content }
    end
  end
end
