class AffiliatesController < ApplicationController
  autocomplete :person, :name, :full => :false
  autocomplete :institution, :name, :full => :false
  # GET /affiliates
  # GET /affiliates.json
  def index
    @affiliates = Affiliate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @affiliates }
    end
  end

  # GET /affiliates/1
  # GET /affiliates/1.json
  def show
    @affiliate = Affiliate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @affiliate }
    end
  end

  # GET /affiliates/new
  # GET /affiliates/new.json
  def new
    if params[:type_ben].nil?

      if params[:type_ben] == "1"
        @benefit_type = Person.find_by_name(:affiliate_benefit)
      elsif params[:type_ben] == "2"
        @benefit_type = Institution.find_by_name(:affiliate_benefit)
      end
    end

    @affiliate = Affiliate.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @affiliate }
    end
  end

  # GET /affiliates/1/edit
  def edit
    @affiliate = Affiliate.find(params[:id])
  end

  # POST /affiliates
  # POST /affiliates.json
  def create
    @affiliate = Affiliate.new(params[:affiliate])

    respond_to do |format|
      if @affiliate.save
        format.html { redirect_to @affiliate, notice: 'Affiliate was successfully created.' }
        format.json { render json: @affiliate, status: :created, location: @affiliate }
      else
        format.html { render action: "new" }
        format.json { render json: @affiliate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /affiliates/1
  # PUT /affiliates/1.json
  def update
    @affiliate = Affiliate.find(params[:id])

    respond_to do |format|
      if @affiliate.update_attributes(params[:affiliate])
        format.html { redirect_to @affiliate, notice: 'Affiliate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @affiliate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /affiliates/1
  # DELETE /affiliates/1.json
  def destroy
    @affiliate = Affiliate.find(params[:id])
    @affiliate.destroy

    respond_to do |format|
      format.html { redirect_to affiliates_url }
      format.json { head :no_content }
    end
  end

  def search_affiliate
   # @affiliate_benefit = nil
   # @affiliate_benefit = Institution.where("(LOWER(institution.name) ILIKE '%:name%') ", :name => params[:affiliate][:institution])
    if params[:affiliate_per] != "" && params[:affiliate_ins] == "" && params[:field] == "1"
      redirect_to new_affiliate_path(:affiliate_benefit => params[:affiliate_per], :type_ben => params[:field])
    elsif params[:affiliate_per] == "" && params[:affiliate_ins] != "" && params[:field] == "2"
      redirect_to new_affiliate_path(:affiliate_benefit => params[:affiliate_ins], :type_ben => params[:field])
    end

  end
end
