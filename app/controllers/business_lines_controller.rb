class BusinessLinesController < ApplicationController
  # GET /business_lines
  # GET /business_lines.json
  def index
    @business_lines = BusinessLine.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @business_lines }
    end
  end

  # GET /business_lines/1
  # GET /business_lines/1.json
  def show
    @business_line = BusinessLine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @business_line }
    end
  end

  # GET /business_lines/new
  # GET /business_lines/new.json
  def new
    @business_line = BusinessLine.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @business_line }
    end
  end

  # GET /business_lines/1/edit
  def edit
    @business_line = BusinessLine.find(params[:id])
  end

  # POST /business_lines
  # POST /business_lines.json
  def create
    @business_line = BusinessLine.new(params[:business_line])

    respond_to do |format|
      if @business_line.save
        format.html { redirect_to @business_line, notice: 'Business line was successfully created.' }
        format.json { render json: @business_line, status: :created, location: @business_line }
      else
        format.html { render action: "new" }
        format.json { render json: @business_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /business_lines/1
  # PUT /business_lines/1.json
  def update
    @business_line = BusinessLine.find(params[:id])

    respond_to do |format|
      if @business_line.update_attributes(params[:business_line])
        format.html { redirect_to @business_line, notice: 'Business line was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @business_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_lines/1
  # DELETE /business_lines/1.json
  def destroy
    @business_line = BusinessLine.find(params[:id])
    @business_line.destroy

    respond_to do |format|
      format.html { redirect_to business_lines_url }
      format.json { head :no_content }
    end
  end
end
