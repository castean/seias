#encoding:utf-8
class CriticalSuccessFactorTypesController < ApplicationController
  load_and_authorize_resource

  # GET /critical_success_factor_types
  # GET /critical_success_factor_types.json
  def index
    @critical_success_factor_types = CriticalSuccessFactorType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @critical_success_factor_types }
    end
  end

  # GET /critical_success_factor_types/1
  # GET /critical_success_factor_types/1.json
  def show
    @critical_success_factor_type = CriticalSuccessFactorType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @critical_success_factor_type }
    end
  end

  # GET /critical_success_factor_types/new
  # GET /critical_success_factor_types/new.json
  def new
    @critical_success_factor_type = CriticalSuccessFactorType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @critical_success_factor_type }
    end
  end

  # GET /critical_success_factor_types/1/edit
  def edit
    @critical_success_factor_type = CriticalSuccessFactorType.find(params[:id])
  end

  # POST /critical_success_factor_types
  # POST /critical_success_factor_types.json
  def create
    @critical_success_factor_type = CriticalSuccessFactorType.new(params[:critical_success_factor_type])

    respond_to do |format|
      if @critical_success_factor_type.save
        format.html { redirect_to @critical_success_factor_type, notice: 'Tipo de Factor Crítico registrado correctamente.' }
        format.json { render json: @critical_success_factor_type, status: :created, location: @critical_success_factor_type }
      else
        format.html { render action: "new" }
        format.json { render json: @critical_success_factor_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /critical_success_factor_types/1
  # PUT /critical_success_factor_types/1.json
  def update
    @critical_success_factor_type = CriticalSuccessFactorType.find(params[:id])

    respond_to do |format|
      if @critical_success_factor_type.update_attributes(params[:critical_success_factor_type])
        format.html { redirect_to @critical_success_factor_type, notice: 'Tipo de Factor Crítico actualizado correctamente' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @critical_success_factor_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /critical_success_factor_types/1
  # DELETE /critical_success_factor_types/1.json
  def destroy
    @critical_success_factor_type = CriticalSuccessFactorType.find(params[:id])
    @critical_success_factor_type.destroy

    respond_to do |format|
      format.html { redirect_to critical_success_factor_types_url }
      format.json { head :no_content }
    end
  end
end
