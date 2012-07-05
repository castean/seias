#encoding:utf-8
class PedActionLinesController < ApplicationController
  load_and_authorize_resource
  # GET /ped_action_lines
  # GET /ped_action_lines.json
  def index
    @ped_action_lines = PedActionLine.order("hierarchy").all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ped_action_lines }
    end
  end

  # GET /ped_action_lines/1
  # GET /ped_action_lines/1.json
  def show
    @ped_action_line = PedActionLine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ped_action_line }
    end
  end

  # GET /ped_action_lines/new
  # GET /ped_action_lines/new.json
  def new
    @ped_action_line = PedActionLine.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ped_action_line }
    end
  end

  # GET /ped_action_lines/1/edit
  def edit
    @ped_action_line = PedActionLine.find(params[:id])
  end

  # POST /ped_action_lines
  # POST /ped_action_lines.json
  def create
    @ped_action_line = PedActionLine.new(params[:ped_action_line])

    respond_to do |format|
      if @ped_action_line.save
        format.html { redirect_to @ped_action_line, notice: 'Ped action line was successfully created.' }
        format.json { render json: @ped_action_line, status: :created, location: @ped_action_line }
      else
        format.html { render action: "new" }
        format.json { render json: @ped_action_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ped_action_lines/1
  # PUT /ped_action_lines/1.json
  def update
    @ped_action_line = PedActionLine.find(params[:id])

    respond_to do |format|
      if @ped_action_line.update_attributes(params[:ped_action_line])
        format.html { redirect_to @ped_action_line, notice: 'Ped action line was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ped_action_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ped_action_lines/1
  # DELETE /ped_action_lines/1.json
  def destroy
    @ped_action_line = PedActionLine.find(params[:id])
    @ped_action_line.destroy

    respond_to do |format|
      format.html { redirect_to ped_action_lines_url }
      format.json { head :no_content }
    end
  end
end
