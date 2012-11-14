#encoding:utf-8
class PublicTargetsController < ApplicationController
  load_and_authorize_resource
  # GET /public_targets
  # GET /public_targets.json
  def index
    @public_targets = PublicTarget.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @public_targets }
    end
  end

  # GET /public_targets/1
  # GET /public_targets/1.json
  def show
    @public_target = PublicTarget.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @public_target }
    end
  end

  # GET /public_targets/new
  # GET /public_targets/new.json
  def new
    @public_target = PublicTarget.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @public_target }
    end
  end

  # GET /public_targets/1/edit
  def edit
    @public_target = PublicTarget.find(params[:id])
  end

  # POST /public_targets
  # POST /public_targets.json
  def create
    @public_target = PublicTarget.new(params[:public_target])

    respond_to do |format|
      if @public_target.save
        format.html { redirect_to @public_target, notice: 'Public target was successfully created.' }
        format.json { render json: @public_target, status: :created, location: @public_target }
      else
        format.html { render action: "new" }
        format.json { render json: @public_target.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /public_targets/1
  # PUT /public_targets/1.json
  def update
    @public_target = PublicTarget.find(params[:id])

    respond_to do |format|
      if @public_target.update_attributes(params[:public_target])
        format.html { redirect_to @public_target, notice: 'Public target was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @public_target.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /public_targets/1
  # DELETE /public_targets/1.json
  def destroy
    @public_target = PublicTarget.find(params[:id])
    @public_target.destroy

    respond_to do |format|
      format.html { redirect_to public_targets_url }
      format.json { head :no_content }
    end
  end
end
