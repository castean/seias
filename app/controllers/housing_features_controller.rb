class HousingFeaturesController < ApplicationController
  # GET /housing_features
  # GET /housing_features.json
  def index
    @housing_features = HousingFeature.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @housing_features }
    end
  end

  # GET /housing_features/1
  # GET /housing_features/1.json
  def show
    @housing_feature = HousingFeature.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @housing_feature }
    end
  end

  # GET /housing_features/new
  # GET /housing_features/new.json
  def new
    @housing_feature = HousingFeature.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @housing_feature }
    end
  end

  # GET /housing_features/1/edit
  def edit
    @housing_feature = HousingFeature.find(params[:id])
  end

  # POST /housing_features
  # POST /housing_features.json
  def create
    @housing_feature = HousingFeature.new(params[:housing_feature])

    respond_to do |format|
      if @housing_feature.save
        format.html { redirect_to @housing_feature, notice: 'Housing feature was successfully created.' }
        format.json { render json: @housing_feature, status: :created, location: @housing_feature }
      else
        format.html { render action: "new" }
        format.json { render json: @housing_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /housing_features/1
  # PUT /housing_features/1.json
  def update
    @housing_feature = HousingFeature.find(params[:id])

    respond_to do |format|
      if @housing_feature.update_attributes(params[:housing_feature])
        format.html { redirect_to @housing_feature, notice: 'Housing feature was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @housing_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /housing_features/1
  # DELETE /housing_features/1.json
  def destroy
    @housing_feature = HousingFeature.find(params[:id])
    @housing_feature.destroy

    respond_to do |format|
      format.html { redirect_to housing_features_url }
      format.json { head :no_content }
    end
  end
end
