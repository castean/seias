class OfficeAllocationsController < ApplicationController
  load_and_authorize_resource
  before_filter :find_office
  # GET /office_allocations
  # GET /office_allocations.json
  def index
    @office_allocations = OfficeAllocation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @office_allocations }
    end
  end

  # GET /office_allocations/1
  # GET /office_allocations/1.json
  def show
    @office_allocation = OfficeAllocation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @office_allocation }
    end
  end

  # GET /office_allocations/new
  # GET /office_allocations/new.json
  def new
    @office_allocation = OfficeAllocation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @office_allocation }
    end
  end

  # GET /office_allocations/1/edit
  def edit
    @office_allocation = OfficeAllocation.find(params[:id])
  end

  # POST /office_allocations
  # POST /office_allocations.json
  def create
    @office_allocation = Office.find_by_id(params[:user_id])
    @office_allocation.office_id = @office
    @office_allocation = @office.office_allocation.build(params[:office_allocation])

    respond_to do |format|
      if @office_allocation.save
        format.html { redirect_to @office, notice: 'Office allocation was successfully created.' }
        format.json { render json: @office_allocation, status: :created, location: @office_allocation }
      else
        format.html { render action: "new" }
        format.json { render json: @office_allocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /office_allocations/1
  # PUT /office_allocations/1.json
  def update
    @office_allocation = OfficeAllocation.find(params[:id])

    respond_to do |format|
      if @office_allocation.update_attributes(params[:office_allocation])
        format.html { redirect_to @office_allocation, notice: 'Office allocation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @office_allocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /office_allocations/1
  # DELETE /office_allocations/1.json
  def destroy
    @office_allocation = OfficeAllocation.find(params[:id])
    @office_allocation.destroy

    respond_to do |format|
      format.html { redirect_to office_allocations_url }
      format.json { head :no_content }
    end
  end
  protected
  def find_office
    @office = Office.find(params[:office_id])
  end
end
