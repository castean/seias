class BenefitsController < ApplicationController
  load_and_authorize_resource
  # GET /benefits
  # GET /benefits.json
  def index
    @benefits = Benefit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @benefits }
    end
  end

  # GET /benefits/1
  # GET /benefits/1.json
  def show
    @benefit = Benefit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @benefit }
    end
  end

  # GET /benefits/new
  # GET /benefits/new.json
  def new
    @benefit = Benefit.new
    if params[:id]
      if params[:type] == 'per'
        person_id = params[:id]
        @affiliate = Affiliate.find_all_by_person_id(person_id)
      elsif params[:type] == 'ins'
        institution_id = params[:id]
        @affiliate = Affiliate.find_all_by_institution_ben_id(institution_id)
      end
    end
    if params[:continuos] == '1'

      @benefit_s = Benefit.find_all_by_affiliate_id(params[:aff])

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @benefit_s }

      end
    else
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @benefit }
    end
    end
  end

  # GET /benefits/1/edit
  def edit
    @benefit = Benefit.find(params[:id])
  end

  # POST /benefits
  # POST /benefits.json
  def create
    @benefit = Benefit.new(params[:benefit])

    respond_to do |format|
      if @benefit.save
        #format.html { redirect_to @benefit, notice: 'Benefit was successfully created.' }



        flash[:notice] = 'El apoyo se dio de alta satisfactoriamente.'
        if @benefit.affiliate.institution_ben_id.nil?
          format.html { redirect_to(:action => 'new', :id => @benefit.affiliate.person_id , :continuos => 1,:type => 'per',:aff=>@benefit.affiliate_id, :aff_act_id=>@benefit.affiliate.activity_type_id )}
        elsif @benefit.affiliate.person_id.nil?
          format.html { redirect_to(:action => 'new', :id => @benefit.affiliate.institution_ben_id , :continuos => 1,:type => 'ins',:aff=>@benefit.affiliate_id, :aff_act_id=>@benefit.affiliate.activity_type_id )}
        end
        #format.json { render json: @benefit, status: :created, location: @benefit }
      else
        format.html { render action: "new" }
        format.json { render json: @benefit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /benefits/1
  # PUT /benefits/1.json
  def update
    @benefit = Benefit.find(params[:id])

    respond_to do |format|
      if @benefit.update_attributes(params[:benefit])
        format.html { redirect_to @benefit, notice: 'Benefit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @benefit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /benefits/1
  # DELETE /benefits/1.json
  def destroy
    @benefit = Benefit.find(params[:id])

    @benefit.destroy

    respond_to do |format|
      #format.html { redirect_to benefits_url }
      if @benefit.affiliate.institution_ben_id.nil?
        format.html { redirect_to(:action => 'new', :id => @benefit.affiliate.person_id , :continuos => 1,:type => 'per',:aff=>@benefit.affiliate_id, :aff_act_id=>@benefit.affiliate.activity_type_id )}
      elsif @benefit.affiliate.person_id.nil?
        format.html { redirect_to(:action => 'new', :id => @benefit.affiliate.institution_ben_id , :continuos => 1,:type => 'ins',:aff=>@benefit.affiliate_id, :aff_act_id=>@benefit.affiliate.activity_type_id )}
      end

      format.json { head :no_content }
    end
  end

  # ISC Christian Ivan Alderete Garcia funcion para cambiar valores con CoffeScript y json
  def for_category_id
    @benefit_category = BenefitType.find_all_by_benefit_category_id(params[:benefit_category_id])

    respond_to do |format|
      format.json  { render :json => @benefit_category.to_json}
    end
  end
end
