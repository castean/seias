class SexennialStatePlanComponentsController < ApplicationController
  load_and_authorize_resource

  # GET /sexennial_state_plan_components
  # GET /sexennial_state_plan_components.json
  def index
    @sexennial_state_plan_components = SexennialStatePlanComponent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sexennial_state_plan_components }
    end
  end

  # GET /sexennial_state_plan_components/1
  # GET /sexennial_state_plan_components/1.json
  def show
    @sexennial_state_plan_component = SexennialStatePlanComponent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sexennial_state_plan_component }
    end
  end

  # GET /sexennial_state_plan_components/new
  # GET /sexennial_state_plan_components/new.json
  def new
    @sexennial_state_plan_component = SexennialStatePlanComponent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sexennial_state_plan_component }
    end
  end

  # GET /sexennial_state_plan_components/1/edit
  def edit
    @sexennial_state_plan_component = SexennialStatePlanComponent.find(params[:id])
  end

  # POST /sexennial_state_plan_components
  # POST /sexennial_state_plan_components.json
  def create
    @sexennial_state_plan_component = SexennialStatePlanComponent.new(params[:sexennial_state_plan_component])

    respond_to do |format|
      if @sexennial_state_plan_component.save
        format.html { redirect_to @sexennial_state_plan_component, notice: 'Componente del Plan Estatal Sexenal registrado correctamente' }
        format.json { render json: @sexennial_state_plan_component, status: :created, location: @sexennial_state_plan_component }
      else
        format.html { render action: "new" }
        format.json { render json: @sexennial_state_plan_component.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sexennial_state_plan_components/1
  # PUT /sexennial_state_plan_components/1.json
  def update
    @sexennial_state_plan_component = SexennialStatePlanComponent.find(params[:id])

    respond_to do |format|
      if @sexennial_state_plan_component.update_attributes(params[:sexennial_state_plan_component])
        format.html { redirect_to @sexennial_state_plan_component, notice: 'Componente del Plan Estatal Sexenal actualizado correctamente' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sexennial_state_plan_component.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sexennial_state_plan_components/1
  # DELETE /sexennial_state_plan_components/1.json
  def destroy
    @sexennial_state_plan_component = SexennialStatePlanComponent.find(params[:id])
    @sexennial_state_plan_component.destroy

    respond_to do |format|
      format.html { redirect_to sexennial_state_plan_components_url }
      format.json { head :no_content }
    end
  end
end
