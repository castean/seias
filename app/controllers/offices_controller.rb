class OfficesController < ApplicationController
  #load_and_authorize_resource
  autocomplete :person, :last_name, :extra_data => [:name, :second_last_name],:display_value => :fullname
  autocomplete :institution, :name, :full => :false

  # GET /offices
  # GET /offices.json
  def index
    if params[:q].nil?
      @search = Office.search("department_id_eq"=>"#{current_user.department_id}")
      @offices = @search.result.order("internal_office_number DESC").page(params[:page]).per(25)
    else
      condition  = params[:q]
      condition.merge("department_id_eq"=>"#{current_user.department_id}")
      @search = Office.search(condition)
      @offices = @search.result.order("internal_office_number DESC").page(params[:page]).per(25)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @offices }
    end
  end

  # GET /offices/1
  # GET /offices/1.json
  def show
    @office = Office.find(params[:id])
    @allocationpage = @office.office_allocations.order("id DESC").page(params[:page]).per(20)
    @recordpage = @office.office_records.order("id DESC").page(params[:page]).per(20)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @office }
    end
  end

  # GET /offices/new
  # GET /offices/new.json
  def new
    @office = Office.new
    1.times { @office.office_benefit_requesteds.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @office }
    end
  end

  # GET /offices/1/edit
  def edit
    @office = Office.find(params[:id])
  end

  # POST /offices
  # POST /offices.json

  def create
    @office = Office.new(params[:office])
    respond_to do |format|
      if @office.save
        UserMailer.send_new_office(@office).deliver
        format.html { redirect_to @office, notice: 'Office was successfully created.'  }
        format.json { render json: @office, status: :created, location: @office }
      else
        format.html { render action: "new" }
        format.json { render json: @office.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /offices/1
  # PUT /offices/1.json
  def update
    @office = Office.find(params[:id])

    respond_to do |format|
      if @office.update_attributes(params[:office])
        format.html { redirect_to @office, notice: 'Office was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @office.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offices/1
  # DELETE /offices/1.json
  def destroy
    @office = Office.find(params[:id])
    @office.destroy

    respond_to do |format|
      format.html { redirect_to offices_url }
      format.json { head :no_content }
    end
  end

  def for_program_id

    sql = "Select distinct activity_types.name, activity_types.id from activity_types INNER JOIN activity_types_critical_success_factors ON activity_types_critical_success_factors.activity_type_id = activity_types.id
                      INNER JOIN critical_success_factors ON critical_success_factors.id = activity_types_critical_success_factors.critical_success_factor_id
                      INNER JOIN Programs ON programs.id = critical_success_factors.program_id INNER JOIN directions ON directions.id = programs.direction_id
                      WHERE programs.id = #{params[:program_id]} order by activity_types.name"
    @filter_activity_types = ActiveRecord::Base.connection.select_rows(sql)
    @filter_activity_types.map{|name, id|}
    respond_to do |format|
      format.html # new.html.erb
      format.json  { render :json => @filter_activity_types}
    end
  end

  def end_office
    @office = Office.find(params[:id])
    @office.update_attribute :status_id, "4"

    respond_to do |format|
      format.html { redirect_to offices_url }
      format.json { head :no_content }
    end
  end

  def for_benefitcategoryid
    @benefit_types = BenefitType.find_all_by_benefit_category_id( params[:benefit_category_id]).sort_by{ |k| k['name'] }
    respond_to do |format|
      format.json  { render :json => @benefit_types }
    end
  end
  def notification
    @office = Office.last
        UserMailer.send_notification(@office).deliver
  end

end
