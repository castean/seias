class AffiliatesController < ApplicationController
  load_and_authorize_resource
  autocomplete :person, :name, :extra_data => [:last_name, :second_last_name],:display_value => :fullname

  autocomplete :institution, :name, :full => :false
  #autocomplete_last_name
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
    @affiliate = Affiliate.new

    if params[:type] == "ben" or (params[:ben_aff] != "" and params[:field] != "")
      if params[:field] == "1"
        if params[:ben_aff].to_s != ""
          @affiliate_benefit = Person.find(params[:ben_aff])
          respond_to do |format|
            format.html # new.html.erb
            format.json  { render :json => @affiliate_benefit}
          end
        else
          name_ben = params[:affiliates][:person]
          sql = "Select id , name || ' ' || last_name || ' ' || second_last_name as nameben from people WHERE
          (LOWER(people.name || ' ' || people.last_name || ' ' || people.second_last_name)
          ILIKE '%#{name_ben}%') ORDER BY people.name"
          @affiliate_benefit = ActiveRecord::Base.connection.select_rows(sql)
          @affiliate_benefit.map{|nameben, id|}
          respond_to do |format|
            format.html # new.html.erb
            format.json  { render :json => @affiliate_benefit}
          end
        end
      elsif params[:field] == "2"
        if params[:ben_aff].to_s != ""
          @affiliate_benefit = Institution.find(params[:ben_aff])
          respond_to do |format|
            format.html # new.html.erb
            format.json  { render :json => @affiliate_benefit}
          end
        else
          name_ben = params[:affiliates][:institution]
          @affiliate_benefit = Institution.order(:name).where("LOWER(institutions.name) ILIKE '%#{name_ben}%'")
          respond_to do |format|
            format.html # new.html.erb
            format.json  { render :json => @affiliate_benefit}
          end
        end
      end
    else
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @affiliate }
      end
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
    if @affiliate.type == 'per'
      @aff = Affiliate.find_all_by_person_id_and_activity_type_id(@affiliate.person_id, @affiliate.activity_type_id)
      @ben_id = @affiliate.person_id
    elsif @affiliate.type == 'ins'
      @aff = Affiliate.find_all_by_person_id_and_activity_type_id(@affiliate.institution_ben_id, @affiliate.activity_type_id)
      @ben_id = @affiliate.institution_ben_id
    end
    if @aff.count >= 1
      respond_to do |format|
        format.html { redirect_to  new_affiliate_path(@affiliate, :id => @ben_id, :type => @affiliate.type), notice: 'Ya esta afiliado a este programa'}
        format.json { render json: @affiliate.errors, status: :unprocessable_entity }
      end
    else
    respond_to do |format|
      if @affiliate.save
          format.html { redirect_to new_benefit_path + '/' + @ben_id.to_s + '?type=' + @affiliate.type, notice: 'Affiliate was successfully created.' }
          format.json { render json: @affiliate, status: :created, location: @affiliate }
      else
        format.html { redirect_to  new_affiliate_path(@affiliate, :id => @ben_id, :type => @affiliate.type), notice: 'Llena todos los campos'}
        format.json { render json: @affiliate.errors, status: :unprocessable_entity }
      end
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

  # Ing. César Reyes # Carga Valores de Activity_Types con CoffeScript y json
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
end

