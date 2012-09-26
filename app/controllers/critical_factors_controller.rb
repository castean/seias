class CriticalFactorsController < ApplicationController
  # GET /critical_factors
  # GET /critical_factors.json
  def index
    @critical_factors = CriticalFactor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @critical_factors }
    end
  end

  # GET /critical_factors/1
  # GET /critical_factors/1.json
  def show
    @critical_factor = CriticalFactor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @critical_factor }
    end
  end

  # GET /critical_factors/new
  # GET /critical_factors/new.json
  def new
    @critical_factor = CriticalFactor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @critical_factor }
    end
  end

  # GET /critical_factors/1/edit
  def edit
    @critical_factor = CriticalFactor.find(params[:id])
  end

  # POST /critical_factors
  # POST /critical_factors.json
  def create
    @critical_factor = CriticalFactor.new(params[:critical_factor])
    @critical_factor.user = current_user
    @critical_factor.confidential = false


    respond_to do |format|
      if @critical_factor.save
        format.html { redirect_to @critical_factor, notice: 'Critical factor was successfully created.'}
        format.json { render json: @critical_factor, status: :created, location: @critical_factor }

      else
        format.html { render action: "new" }
        format.json { render json: @critical_factor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /critical_factors/1
  # PUT /critical_factors/1.json
  def update
    @critical_factor = CriticalFactor.find(params[:id])

    respond_to do |format|
      if @critical_factor.update_attributes(params[:critical_factor])
        format.html { redirect_to @critical_factor, notice: 'Critical factor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @critical_factor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /critical_factors/1
  # DELETE /critical_factors/1.json
  def destroy
    @critical_factor = CriticalFactor.find(params[:id])
    @critical_factor.destroy

    respond_to do |format|
      format.html { redirect_to critical_factors_url }
      format.json { head :no_content }
    end
  end

  def for_catalog_table_id
    c = CatalogTable.find(params[:table])

    @sql = "SELECT " + c.table + ".description, " + c.table + ".id as proc_id FROM " +  c.table
    ppal = ActiveRecord::Base.connection.select_rows(@sql)
    ppal.map{|proc_id,description|}

    #@t = ActiveRecord::Base.connection.select_rows(@sql)

    respond_to do |format|
      format.json  { render :json => ppal}
    end
  end
end
