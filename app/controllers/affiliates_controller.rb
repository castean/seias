class AffiliatesController < ApplicationController
  autocomplete :person, :name, :extra_data => [:last_name],:full => :false
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
    @affiliate = Affiliate.new

    if params[:type] == "ben"
      if params[:field] == "1"
        name_ben = params[:affiliates][:person]
        sql = "Select id , name from people WHERE (LOWER(people.name) ILIKE '%#{name_ben}%') ORDER BY people.name"
        @affiliate_benefit = ActiveRecord::Base.connection.select_rows(sql)
        @affiliate_benefit.map{|name, id|}
        respond_to do |format|
          format.html # new.html.erb
          format.json  { render :json => @affiliate_benefit}
        end
        #@affiliate_benefit = Person.where(:id => "12")
      elsif params[:field] == "2"
        name_ben = params[:affiliates][:institution]
        @affiliate_benefit = Institution.find(1)
      end
    elsif params[:ben_aff] != "" && params[:type_ben]!= ""
        if params[:type_ben] == "ben"
          @affiliate_p = Person.find(params[:ben_aff])
          respond_to do |format|
            format.html # new.html.erb
            format.json  { render :json => @affiliate_p}
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

    #if params[:affiliate_per] != "" && params[:affiliate_ins] == "" && params[:field] == "1"
     # @affiliate_benefit = Person.where("(LOWER(people.name) ILIKE '%:name%') ", :name => params[:affiliate_per])
      #redirect_to new_affiliate_path(:affiliate_benefit => params[:affiliate_per], :type_ben => params[:field])
   # elsif params[:affiliate_per] == "" && params[:affiliate_ins] != "" && params[:field] == "2"
      #@affiliate_benefit = Institution.where("(LOWER(institutions.name) ILIKE '%:name%') ", :name => params[:affiliate_ins])
      #redirect_to new_affiliate_path(:affiliate_benefit => params[:affiliate_ins], :type_ben => params[:field])
    #end
      respond_to do |format|
        format.html { redirect_to new_affiliate_path(params[:affiliate_ins], params[:field]) }

      end

  end

  # Ing. César Reyes # Carga Valores de Activity_Types con CoffeScript y json
  def for_programid

    sql = "Select distinct activity_types.name, activity_types.id from activity_types INNER JOIN activity_types_critical_success_factors ON activity_types_critical_success_factors.activity_type_id = activity_types.id
                      INNER JOIN critical_success_factors ON critical_success_factors.id = activity_types_critical_success_factors.critical_success_factor_id
                      INNER JOIN Programs ON programs.id = critical_success_factors.program_id INNER JOIN directions ON directions.id = programs.direction_id
                      WHERE programs.id = #{params[:program_id]} order by activity_types.name"
    @filter_activity_types = ActiveRecord::Base.connection.select_rows(sql)
    @filter_activity_types.map{|name, id|}
    respond_to do |format|
      format.json  { render :json => @filter_activity_types}
    end
  end
end

