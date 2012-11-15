class OneRegInstitutionsController < ApplicationController
  load_and_authorize_resource
  before_filter :find_institution

  # GET /one_reg_institutions
  # GET /one_reg_institutions.json
  def index
    @one_reg_institutions = OneRegInstitution.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @one_reg_institutions }
    end
  end

  # GET /one_reg_institutions/1
  # GET /one_reg_institutions/1.json
  def show
    @one_reg_institution = OneRegInstitution.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @one_reg_institution }
    end
  end

  # GET /one_reg_institutions/new
  # GET /one_reg_institutions/new.json
  def new
    @one_reg_institution = OneRegInstitution.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @one_reg_institution }
    end
  end

  # GET /one_reg_institutions/1/edit
  def edit
    @one_reg_institution = OneRegInstitution.find(params[:id])
  end

  # POST /one_reg_institutions
  # POST /one_reg_institutions.json
  def create
    @one_reg_institution.institution_id = @institution
    @one_reg_institution = @institution.one_reg_institutions.build(params[:one_reg_institution])

    respond_to do |format|
      if @one_reg_institution.save
        format.html { redirect_to @institution, notice: 'Reg-Inst.1/R01 Creado Exitosamente.' }
        format.json { render json: @one_reg_institution, status: :created, location: @one_reg_institution }
      else
        format.html { render action: "new" }
        format.json { render json: @one_reg_institution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /one_reg_institutions/1
  # PUT /one_reg_institutions/1.json
  def update
    @one_reg_institution = OneRegInstitution.find(params[:id])

    respond_to do |format|
      if @one_reg_institution.update_attributes(params[:one_reg_institution])
        format.html { redirect_to @one_reg_institution, notice: 'One reg institution was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @one_reg_institution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /one_reg_institutions/1
  # DELETE /one_reg_institutions/1.json
  def destroy
    @one_reg_institution = OneRegInstitution.find(params[:id])
    @one_reg_institution.destroy

    respond_to do |format|
      format.html { redirect_to one_reg_institutions_url }
      format.json { head :no_content }
    end
  end
  protected
  def find_institution
    @institution = Institution.find(params[:institution_id])
  end
end
