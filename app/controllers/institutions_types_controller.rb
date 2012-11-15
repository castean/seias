class InstitutionsTypesController < ApplicationController
  # GET /institutions_types
  # GET /institutions_types.json
  def index
    @institutions_types = InstitutionsType.order("id").all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @institutions_types }
    end
  end

  # GET /institutions_types/1
  # GET /institutions_types/1.json
  def show
    @institutions_type = InstitutionsType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @institutions_type }
    end
  end

  # GET /institutions_types/new
  # GET /institutions_types/new.json
  def new
    @institutions_type = InstitutionsType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @institutions_type }
    end
  end

  # GET /institutions_types/1/edit
  def edit
    @institutions_type = InstitutionsType.find(params[:id])
  end

  # POST /institutions_types
  # POST /institutions_types.json
  def create
    @institutions_type = InstitutionsType.new(params[:institutions_type])

    respond_to do |format|
      if @institutions_type.save
        format.html { redirect_to @institutions_type, notice: 'Institutions type was successfully created.' }
        format.json { render json: @institutions_type, status: :created, location: @institutions_type }
      else
        format.html { render action: "new" }
        format.json { render json: @institutions_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /institutions_types/1
  # PUT /institutions_types/1.json
  def update
    @institutions_type = InstitutionsType.find(params[:id])

    respond_to do |format|
      if @institutions_type.update_attributes(params[:institutions_type])
        format.html { redirect_to @institutions_type, notice: 'Institutions type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @institutions_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /institutions_types/1
  # DELETE /institutions_types/1.json
  def destroy
    @institutions_type = InstitutionsType.find(params[:id])
    @institutions_type.destroy

    respond_to do |format|
      format.html { redirect_to institutions_types_url }
      format.json { head :no_content }
    end
  end
  def for_institution_type_id
    c = InstitutionsType.find(params[:id])

    @sql = "SELECT name, id as proc_id FROM business_lines where business_lines.institutions_type_id = " +  c.id.to_s
    ppal = ActiveRecord::Base.connection.select_rows(@sql)
    ppal.map{|proc_id,name|}

    #@t = ActiveRecord::Base.connection.select_rows(@sql)

    respond_to do |format|
      format.json  { render :json => ppal}
    end
  end
end
