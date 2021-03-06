#encoding:utf-8
class ProgramsController < ApplicationController
  load_and_authorize_resource
  # GET /programs
  # GET /programs.json
  def index
    @programs = Program.order("name").all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @programs }
      end
  end

  # GET /programs/1
  # GET /programs/1.json
  def show
    @program = Program.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @program }
    end
  end

  # GET /programs/new
  # GET /programs/new.json
  def new
    @program = Program.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @program }
    end
  end

  # GET /programs/1/edit
  def edit
    @program = Program.find(params[:id])
  end

  # POST /programs
  # POST /programs.json
  def create
    @program = Program.new(params[:program])

    respond_to do |format|
      if @program.save
        format.html { redirect_to @program, notice: 'Program was successfully created.' }
        format.json { render json: @program, status: :created, location: @program }
      else
        format.html { render action: "new" }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /programs/1
  # PUT /programs/1.json
  def update
    @program = Program.find(params[:id])

    respond_to do |format|
      if @program.update_attributes(params[:program])
        format.html { redirect_to @program, notice: 'Program was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programs/1
  # DELETE /programs/1.json
  def destroy
    @program = Program.find(params[:id])
    @program.destroy

    respond_to do |format|
      format.html { redirect_to programs_url }
      format.json { head :no_content }
    end
  end
  #ISC Christian Ivan Alderete Garcia funcion para reportes

  def program_search
    @programs = Program.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @program }
    end
  end

  def program_report
    #@program = Program.find(params[:id])
    @date_ini =  params[:start_date][:start_date]
    @date_end =  params[:end_date][:end_date]
    @prog_type = params[:finder][:qty]

    if @date_ini == "" or @date_end == ""
      redirect_to programs_report_path, :notice => "Debes de llenar todos los campos"
    elsif @prog_type == "all"
      redirect_to programs_program_report_all_path(request.parameters)
    else
      userid = Direction.find_by_user_id(current_user)
      if userid.nil?
        if params[:finder][:program] == "program"

          @program = Program.select('programs.*, activity_types.name as anombre, activity_types.description as ndesc,sum(cast(activities.value as int)) as totalv, sum(activities.qty_men) as hombre,
                    sum(activities.qty_women) as mujer, sum(activities.qty_men) + sum(activities.qty_women) as totalp
                    ').joins(:critical_success_factors => {:activity_types => :activities }).group('activities.activity_type_id,programs.id,programs.description,programs.name,programs.department_id,programs.responsable_id,
                    programs.created_at,programs.updated_at,programs.direction_id,programs.cut_day,programs.program_start_date,activity_types.name,activity_types.description').where("
                    activities.user_id = :usr_id and programs.id = :program_id and activities.activity_date_start > :start_date and activities.activity_date_end < :end_date
                    ", {:usr_id => current_user ,:program_id => params[:program_id][:program_id], :start_date => (params[:start_date][:start_date]).to_date - 1, :end_date => (params[:end_date][:end_date]).to_date + 1})
        elsif params[:finder][:program] == "pajs"
          @program = Program.select('programs.name as pnombre, programs.description pdescripcion, activity_types.name as anombre, activity_types.description as ndesc,judicial_districts.name dnombre,sum(cast(activities.value as int)) as totalv'
          ).order("judicial_districts.name, activity_types.name") .joins(:critical_success_factors => {:activity_types => {:activities => {:town => {:county => :judicial_districts}}}}).group('programs.name,
                      programs.description,activities.activity_type_id,activity_types.name,
                      activity_types.description, judicial_districts.id,judicial_districts.name'
          ).where("activities.user_id = :usr_id and programs.id = :program_id and activities.activity_date_start > :start_date and activities.activity_date_end < :end_date ",
                  {:usr_id => current_user ,:program_id => params[:program_id][:program_id], :start_date => (params[:start_date][:start_date]).to_date - 1, :end_date => (params[:end_date][:end_date]).to_date + 1})

        end
      else
        if params[:finder][:program] == "program"

          @program = Program.select('programs.*, activity_types.name as anombre, activity_types.description as ndesc,sum(cast(activities.value as int)) as totalv, sum(activities.qty_men) as hombre,
                    sum(activities.qty_women) as mujer, sum(activities.qty_men) + sum(activities.qty_women) as totalp
                    ').joins(:critical_success_factors => {:activity_types => :activities }).group('activities.activity_type_id,programs.id,programs.description,programs.name,programs.department_id,programs.responsable_id,
                    programs.created_at,programs.updated_at,programs.direction_id,programs.cut_day,programs.program_start_date,activity_types.name,activity_types.description').where("
                    programs.department_id in (select id from departments where direction_id = (select id from directions where user_id = :usr_id) )
                    and programs.id = :program_id and activities.activity_date_start > :start_date and activities.activity_date_end < :end_date
                    ", {:usr_id => current_user ,:program_id => params[:program_id][:program_id], :start_date => (params[:start_date][:start_date]).to_date - 1, :end_date => (params[:end_date][:end_date]).to_date + 1})
        elsif params[:finder][:program] == "pajs"
          @program = Program.select('programs.name as pnombre, programs.description pdescripcion, activity_types.name as anombre, activity_types.description as ndesc,judicial_districts.name dnombre,sum(cast(activities.value as int)) as totalv'
          ).order("judicial_districts.name, activity_types.name") .joins(:critical_success_factors => {:activity_types => {:activities => {:town => {:county => :judicial_districts}}}}).group('programs.name,
                      programs.description,activities.activity_type_id,activity_types.name,
                      activity_types.description, judicial_districts.id,judicial_districts.name').where("
          programs.department_id in (select id from departments where direction_id = (select id from directions where user_id = :usr_id))
          and programs.id = :program_id and activities.activity_date_start > :start_date and activities.activity_date_end < :end_date ",
                                                                                                        {:usr_id => current_user ,:program_id => params[:program_id][:program_id], :start_date => (params[:start_date][:start_date]).to_date - 1, :end_date => (params[:end_date][:end_date]).to_date + 1})

        end
      end

      respond_to do |format|
        format.html # index.html.erb

        if params[:finder][:program] == "program"
          format.xls { send_data @program.to_xls(:columns => [:name, :description, :anombre, :ndesc, :totalv, :hombre, :mujer, :totalp], :headers => ['Programa', 'Descripcion del Programa', 'Actividad', 'Descripcion Actividad','Total Cantidades','Hombres','Mujeres','Total Personas']), content_type: 'application/vnd.ms-excel', filename: 'programas.xls' }
        elsif params[:finder][:program] == "pajs"
          format.xls { send_data @program.to_xls(:columns => [:pnombre, :pdescripcion, :anombre, :ndesc, :dnombre,:totalv], :headers => ['Programa', 'Descripcion del Programa', 'Actividad', 'Descripcion Actividad','Distrito Judicial','Total de Actividades']), content_type: 'application/vnd.ms-excel', filename: 'distritos.xls' }
        end
        format.json { render json: @program }

      end
    end
  end
  def program_report_all
    userid = Direction.find_by_user_id(current_user)
    if userid.nil?
      if params[:finder][:program] == "program"
        @program = Program.select('programs.*, activity_types.name as anombre, activity_types.description as ndesc,sum(cast(activities.value as int)) as totalv, sum(activities.qty_men) as hombre,
                sum(activities.qty_women) as mujer, sum(activities.qty_men) + sum(activities.qty_women) as totalp
                ').joins(:critical_success_factors => {:activity_types => :activities }).group('activities.activity_type_id,programs.id,programs.description,programs.name,programs.department_id,programs.responsable_id,
                programs.created_at,programs.updated_at,programs.direction_id,programs.cut_day,programs.program_start_date,activity_types.name,activity_types.description'
        ).where("activities.user_id = :usr_id and activities.activity_date_start > :start_date and activities.activity_date_end < :end_date
                ", {:usr_id => current_user ,:start_date => (params[:start_date][:start_date]).to_date - 1, :end_date => (params[:end_date][:end_date]).to_date + 1})

      elsif params[:finder][:program] == "pajs"
        @program = Program.select('programs.name as pnombre, programs.description pdescripcion, activity_types.name as anombre, activity_types.description as ndesc,judicial_districts.name dnombre,sum(cast(activities.value as int)) as totalv'
        ).order("judicial_districts.name, activity_types.name").joins(:critical_success_factors => {:activity_types => {:activities => {:town => {:county => :judicial_districts}}}}).group('programs.name,
                    programs.description,activities.activity_type_id,activity_types.name,
                    activity_types.description, judicial_districts.id,judicial_districts.name'
        ).where("activities.user_id = :usr_id and activities.activity_date_start > :start_date and activities.activity_date_end < :end_date ",
                {:usr_id => current_user ,:start_date => (params[:start_date][:start_date]).to_date - 1, :end_date => (params[:end_date][:end_date]).to_date + 1})
      end
    else
      if params[:finder][:program] == "program"
        @program = Program.select('programs.*, activity_types.name as anombre, activity_types.description as ndesc,sum(cast(activities.value as int)) as totalv, sum(activities.qty_men) as hombre,
                sum(activities.qty_women) as mujer, sum(activities.qty_men) + sum(activities.qty_women) as totalp
                ').order("programs.name,programs.description").joins(:critical_success_factors => {:activity_types => :activities }).group('activities.activity_type_id,programs.id,programs.description,programs.name,programs.department_id,programs.responsable_id,
                programs.created_at,programs.updated_at,programs.direction_id,programs.cut_day,programs.program_start_date,activity_types.name,activity_types.description'
        ).where("programs.department_id in (select id from departments where direction_id = (select id from directions where user_id = :usr_id))
                  and activities.activity_date_start > :start_date and activities.activity_date_end < :end_date
                ", {:usr_id => current_user ,:start_date => (params[:start_date][:start_date]).to_date - 1, :end_date => (params[:end_date][:end_date]).to_date + 1})

      elsif params[:finder][:program] == "pajs"
        @program = Program.select('programs.name as pnombre, programs.description pdescripcion, activity_types.name as anombre, activity_types.description as ndesc,judicial_districts.name dnombre,sum(cast(activities.value as int)) as totalv'
        ).order("judicial_districts.name, activity_types.name").joins(:critical_success_factors => {:activity_types => {:activities => {:town => {:county => :judicial_districts}}}}).group('programs.name,
                    programs.description,activities.activity_type_id,activity_types.name,
                    activity_types.description, judicial_districts.id,judicial_districts.name'
        ).where("programs.department_id in (select id from departments where direction_id = (select id from directions where user_id = :usr_id))
        and activities.activity_date_start > :start_date and activities.activity_date_end < :end_date ",
                {:usr_id => current_user ,:start_date => (params[:start_date][:start_date]).to_date - 1, :end_date => (params[:end_date][:end_date]).to_date + 1})
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      if params[:finder][:program] == "program"
        format.xls { send_data @program.to_xls(:columns => [:name, :description, :anombre, :ndesc, :totalv, :hombre, :mujer, :totalp], :headers => ['Programa', 'Descripcion del Programa', 'Actividad','Descripcion Actividad','Total Cantidades','Hombres','Mujeres','Total Personas']), content_type: 'application/vnd.ms-excel', filename: 'todos_programas.xls' }
      elsif params[:finder][:program] == "pajs"
        format.xls { send_data @program.to_xls(:columns => [:pnombre, :pdescripcion, :anombre, :ndesc, :dnombre,:totalv], :headers => ['Programa', 'Descripcion del Programa', 'Actividad','Descripcion Actividad','Distrito Judicial','Total de Actividades']), content_type: 'application/vnd.ms-excel', filename: 'todos_distritos.xls' }
      end
      format.json { render json: @program }
    end
  end
  def program_report_county
    @prog_type = params[:finder][:qty]
    if @prog_type == "one"
      @program = Program.select("programs.name as pnombre, programs.description as pdescripcion, activity_types.name as anombre, activity_types.description as ndesc,
                sum(cast(activities.value as int)) as totalv, sum(activities.qty_men) + sum(activities.qty_women) as totalp,
                to_char(activities.activity_date_start, 'YYYY-MM-DD') as mes, activities.county_id as mun
               ").order("date_part('month', activities.activity_date_start) ").joins(:critical_success_factors => {:activity_types => {:activities => {:town => :county}}}).group("activities.activity_type_id,programs.id,programs.description,programs.name,programs.department_id,programs.responsable_id,
               programs.created_at,programs.updated_at,programs.direction_id,programs.cut_day,programs.program_start_date,activity_types.name, activity_types.description,
                date_part('month', activities.activity_date_start),activities.county_id,to_char(activities.activity_date_start, 'YYYY-MM-DD')").where("activities.county_id = :county_id and
               date_part('year',activities.activity_date_start) = :start_date", {:county_id =>params[:county_id][:cve_mun] ,:start_date => params[:date][:year]})
    elsif  @prog_type == "all"
      @program = Program.select("programs.name as pnombre, programs.description pdescripcion, activity_types.name as anombre, activity_types.description as ndesc,
                sum(cast(activities.value as int)) as totalv,
               sum(activities.qty_men) + sum(activities.qty_women) as totalp, to_char(activities.activity_date_start, 'YYYY-MM-DD') as mes, activities.county_id as mun
               ").order("activities.county_id,date_part('month', activities.activity_date_start) ").joins(:critical_success_factors => {:activity_types => {:activities => {:town => :county}}}).group("activities.activity_type_id,programs.id,programs.description,programs.name,programs.department_id,programs.responsable_id,
               programs.created_at,programs.updated_at,programs.direction_id,programs.cut_day,programs.program_start_date,activity_types.name, activity_types.description,
                date_part('month', activities.activity_date_start),activities.county_id,to_char(activities.activity_date_start, 'YYYY-MM-DD')").where("
               date_part('year',activities.activity_date_start) = :start_date", {:start_date => params[:date][:year]})
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xls { send_data @program.to_xls(:columns => [:pnombre, :pdescripcion, :anombre, :ndesc, :totalv, :totalp, :mun, :mes], :headers => ['Programa', 'Descripcion del Programa', 'Actividad','Descripcion Actividad','Total Actividades','Beneficiados','Municipio', 'Mes']), content_type: 'application/vnd.ms-excel', filename: 'programas_municipios.xls' }
      format.json { render json: @program }
    end
  end

  def for_catalog_table_id
    c = CatalogTable.find(params[:table])

    @sql = "SELECT " + c.table + ".description, " + c.table + ".id as proc_id FROM " +  c.table
    ppal = ActiveRecord::Base.connection.select_rows(@sql)
    ppal.map{|proc_id,description|}

    #@t = ActiveRecord::Base.connection.select_rows(@sql)

    respond_to do |format|
      format.json  { render :json => ppal}
    end
  end
end