class EthnicGroupsController < ApplicationController
  # GET /ethnic_groups
  # GET /ethnic_groups.json
  def index
    @ethnic_groups = EthnicGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ethnic_groups }
    end
  end

  # GET /ethnic_groups/1
  # GET /ethnic_groups/1.json
  def show
    @ethnic_group = EthnicGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ethnic_group }
    end
  end

  # GET /ethnic_groups/new
  # GET /ethnic_groups/new.json
  def new
    @ethnic_group = EthnicGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ethnic_group }
    end
  end

  # GET /ethnic_groups/1/edit
  def edit
    @ethnic_group = EthnicGroup.find(params[:id])
  end

  # POST /ethnic_groups
  # POST /ethnic_groups.json
  def create
    @ethnic_group = EthnicGroup.new(params[:ethnic_group])

    respond_to do |format|
      if @ethnic_group.save
        format.html { redirect_to @ethnic_group, notice: 'Ethnic group was successfully created.' }
        format.json { render json: @ethnic_group, status: :created, location: @ethnic_group }
      else
        format.html { render action: "new" }
        format.json { render json: @ethnic_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ethnic_groups/1
  # PUT /ethnic_groups/1.json
  def update
    @ethnic_group = EthnicGroup.find(params[:id])

    respond_to do |format|
      if @ethnic_group.update_attributes(params[:ethnic_group])
        format.html { redirect_to @ethnic_group, notice: 'Ethnic group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ethnic_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ethnic_groups/1
  # DELETE /ethnic_groups/1.json
  def destroy
    @ethnic_group = EthnicGroup.find(params[:id])
    @ethnic_group.destroy

    respond_to do |format|
      format.html { redirect_to ethnic_groups_url }
      format.json { head :no_content }
    end
  end
end
