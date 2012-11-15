class BenefitCategoriesController < ApplicationController
  # GET /benefit_categories
  # GET /benefit_categories.json
  def index
    @benefit_categories = BenefitCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @benefit_categories }
    end
  end

  # GET /benefit_categories/1
  # GET /benefit_categories/1.json
  def show
    @benefit_category = BenefitCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @benefit_category }
    end
  end

  # GET /benefit_categories/new
  # GET /benefit_categories/new.json
  def new
    @benefit_category = BenefitCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @benefit_category }
    end
  end

  # GET /benefit_categories/1/edit
  def edit
    @benefit_category = BenefitCategory.find(params[:id])
  end

  # POST /benefit_categories
  # POST /benefit_categories.json
  def create
    @benefit_category = BenefitCategory.new(params[:benefit_category])

    respond_to do |format|
      if @benefit_category.save
        format.html { redirect_to @benefit_category, notice: 'Benefit category was successfully created.' }
        format.json { render json: @benefit_category, status: :created, location: @benefit_category }
      else
        format.html { render action: "new" }
        format.json { render json: @benefit_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /benefit_categories/1
  # PUT /benefit_categories/1.json
  def update
    @benefit_category = BenefitCategory.find(params[:id])

    respond_to do |format|
      if @benefit_category.update_attributes(params[:benefit_category])
        format.html { redirect_to @benefit_category, notice: 'Benefit category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @benefit_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /benefit_categories/1
  # DELETE /benefit_categories/1.json
  def destroy
    @benefit_category = BenefitCategory.find(params[:id])
    @benefit_category.destroy

    respond_to do |format|
      format.html { redirect_to benefit_categories_url }
      format.json { head :no_content }
    end
  end
end
