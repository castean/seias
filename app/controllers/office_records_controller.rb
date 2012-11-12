class OfficeRecordsController < ApplicationController
  load_and_authorize_resource
  before_filter :find_office
  # GET /office_records
  # GET /office_records.json
  def index
    @office_records = OfficeRecord.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @office_records }
    end
  end

  # GET /office_records/1
  # GET /office_records/1.json
  def show
    @office_record = OfficeRecord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @office_record }
    end
  end

  # GET /office_records/new
  # GET /office_records/new.json
  def new
    @office_record = OfficeRecord.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @office_record }
    end
  end

  # GET /office_records/1/edit
  def edit
    @office_record = OfficeRecord.find(params[:id])
  end

  # POST /office_records
  # POST /office_records.json
  def create
    @office_record.office_id = @office
    @one_reg_institution = @office.office_record.build(params[:office_record])

    respond_to do |format|
      if @office_record.save
        format.html { redirect_to @office, notice: 'registro creado con excito.' }
        format.json { render json: @office_record, status: :created, location: @office_record }
      else
        format.html { render action: "new" }
        format.json { render json: @office_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /office_records/1
  # PUT /office_records/1.json
  def update
    @office_record = OfficeRecord.find(params[:id])

    respond_to do |format|
      if @office_record.update_attributes(params[:office_record])
        format.html { redirect_to @office_record, notice: 'Office record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @office_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /office_records/1
  # DELETE /office_records/1.json
  def destroy
    @office_record = OfficeRecord.find(params[:id])
    @office_record.destroy

    respond_to do |format|
      format.html { redirect_to office_records_url }
      format.json { head :no_content }
    end
  end
  protected
  def find_office
    @office = Office.find(params[:office_id])
  end
end
