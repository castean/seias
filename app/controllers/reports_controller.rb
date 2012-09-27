#encoding:utf-8
class ReportsController < ApplicationController

  def program_report
    #@program = Program.find(params[:id])
    @date_ini =  params[:start_date][:start_date]
    @date_end =  params[:end_date][:end_date]
    @prog_type = params[:finder][:qty]
    if @date_ini == "" or @date_end == ""
      redirect_to reports_path, :notice => "Debes de llenar todos los campos"
    elsif @prog_type == "all"
      redirect_to programs_program_report_all_path(request.parameters)
    else
      if params[:finder][:program] == "program"

        @program = Program.select('programs.*, activity_types.name as anombre, activity_types.description as ndesc,sum(cast(activities.value as int)) as totalv, sum(activities.qty_men) as hombre,
                  sum(activities.qty_women) as mujer, sum(activities.qty_men) + sum(activities.qty_women) as totalp
                  ').joins(:critical_success_factors => {:activity_types => :activities }).group('activities.activity_type_id,programs.id,programs.description,programs.name,programs.department_id,programs.responsable_id,
                  programs.created_at,programs.updated_at,programs.direction_id,programs.cut_day,programs.program_start_date,activity_types.name,activity_types.description').where("
                  programs.id = :program_id and activities.activity_date_start > :start_date and activities.activity_date_end < :end_date
                  ", {:program_id => params[:program_id][:program_id], :start_date => (params[:start_date][:start_date]).to_date - 1, :end_date => (params[:end_date][:end_date]).to_date + 1})
      elsif params[:finder][:program] == "pajs"
        @program = Program.select('programs.name as pnombre, programs.description pdescripcion, activity_types.name as anombre, activity_types.description as ndesc,judicial_districts.name dnombre,sum(cast(activities.value as int)) as totalv'
        ).joins(:critical_success_factors => {:activity_types => {:activities => {:town => {:county => :judicial_districts}}}}).group('programs.name,
                    programs.description,activities.activity_type_id,activity_types.name,
                    activity_types.description, judicial_districts.id,judicial_districts.name'
        ).where("programs.id = :program_id and activities.activity_date_start > :start_date and activities.activity_date_end < :end_date ",
                {:program_id => params[:program_id][:program_id], :start_date => (params[:start_date][:start_date]).to_date - 1, :end_date => (params[:end_date][:end_date]).to_date + 1})

      end

      respond_to do |format|
        format.html # index.html.erb

        if params[:finder][:program] == "program"
          format.xls { send_data @program.to_xls(:columns => [:name, :description, :anombre, :ndesc, :totalv, :hombre, :mujer, :totalp], :headers => ['Programa', 'Descripcion del Programa', 'Actividad', 'Descripcion Actividad','Total Valor','Hombres','Mujeres','Total Personas']), content_type: 'application/vnd.ms-excel', filename: 'programas.xls' }
        elsif params[:finder][:program] == "pajs"
          format.xls { send_data @program.to_xls(:columns => [:pnombre, :pdescripcion, :anombre, :ndesc, :dnombre,:totalv], :headers => ['Programa', 'Descripcion del Programa', 'Actividad', 'Descripcion Actividad','Distrito Judicial','Total de Actividades']), content_type: 'application/vnd.ms-excel', filename: 'distritos.xls' }
        end
        format.json { render json: @program }

      end
    end
  end
  def program_report_all

    if params[:finder][:program] == "program"
      @program = Program.select('programs.*, activity_types.name as anombre, activity_types.description as ndesc,sum(cast(activities.value as int)) as totalv, sum(activities.qty_men) as hombre,
                sum(activities.qty_women) as mujer, sum(activities.qty_men) + sum(activities.qty_women) as totalp
                ').joins(:critical_success_factors => {:activity_types => :activities }).group('activities.activity_type_id,programs.id,programs.description,programs.name,programs.department_id,programs.responsable_id,
                programs.created_at,programs.updated_at,programs.direction_id,programs.cut_day,programs.program_start_date,activity_types.name,activity_types.description'
      ).where("activities.activity_date_start > :start_date and activities.activity_date_end < :end_date
                ", {:start_date => (params[:start_date][:start_date]).to_date - 1, :end_date => (params[:end_date][:end_date]).to_date + 1})

    elsif params[:finder][:program] == "pajs"
      @program = Program.select('programs.name as pnombre, programs.description pdescripcion, activity_types.name as anombre, activity_types.description as ndesc,judicial_districts.name dnombre,sum(cast(activities.value as int)) as totalv'
      ).joins(:critical_success_factors => {:activity_types => {:activities => {:town => {:county => :judicial_districts}}}}).group('programs.name,
                    programs.description,activities.activity_type_id,activity_types.name,
                    activity_types.description, judicial_districts.id,judicial_districts.name'
      ).where("activities.activity_date_start > :start_date and activities.activity_date_end < :end_date ",
              {:start_date => (params[:start_date][:start_date]).to_date - 1, :end_date => (params[:end_date][:end_date]).to_date + 1})
    end


    respond_to do |format|
      format.html # index.html.erb
      if params[:finder][:program] == "program"
        format.xls { send_data @program.to_xls(:columns => [:name, :description, :anombre, :ndesc, :totalv, :hombre, :mujer, :totalp], :headers => ['Programa', 'Descripcion del Programa', 'Actividad','Descripcion Actividad','Total Valor','Hombres','Mujeres','Total Personas']), content_type: 'application/vnd.ms-excel', filename: 'todos_programas.xls' }
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
               ").order("activities.county_id,date_part('month', activities.activity_date_start) ").joins(:critical_success_factors => {:activity_types => {:activities => {:town => :county}}}).group("activities.activity_type_id,programs.id,programs.description,programs.name,programs.department_id,programs.responsable_id,
               programs.created_at,programs.updated_at,programs.direction_id,programs.cut_day,programs.program_start_date,activity_types.name, activity_types.description,
                date_part('month', activities.activity_date_start),activities.county_id,to_char(activities.activity_date_start, 'YYYY-MM-DD')").where("activities.county_id = :county_id and
               date_part('year',activities.activity_date_start) = :start_date", {:county_id =>params[:county_id][:cve_mun] ,:start_date => params[:date][:year]})
    elsif  @prog_type == "all"
      @program = Program.select("programs.name as pnombre, programs.description pdescripcion, activity_types.name as anombre, activity_types.description as ndesc,
                sum(cast(activities.value as int)) as totalv,
               sum(activities.qty_men) + sum(activities.qty_women) as totalp, to_char(activities.activity_date_start, 'YYYY-MM-DD') as mes, counties.name as mun
               ").order("activities.county_id,date_part('month', activities.activity_date_start) ").joins(:critical_success_factors => {:activity_types => {:activities => :county}}).group("activities.activity_type_id,programs.id,programs.description,programs.name,programs.department_id,programs.responsable_id,
               programs.created_at,programs.updated_at,programs.direction_id,programs.cut_day,programs.program_start_date,activity_types.name, activity_types.description,
                date_part('month', activities.activity_date_start),activities.county_id,counties.name,to_char(activities.activity_date_start, 'YYYY-MM-DD')").where("
                counties.state_id = 8 and date_part('year',activities.activity_date_start) = :start_date", {:start_date => params[:date][:year]})
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xls { send_data @program.to_xls(:columns => [:pnombre, :pdescripcion, :anombre, :ndesc, :totalv, :totalp, :mun, :mes], :headers => ['Programa', 'Descripcion del Programa', 'Actividad','Descripcion Actividad','Total Actividades','Beneficiados','Municipio', 'Mes']), content_type: 'application/vnd.ms-excel', filename: 'programas_municipios.xls' }
      format.json { render json: @program }
    end
  end

  def report_town_act
    @date_ini =  params[:start_date][:start_date]
    @date_end =  params[:end_date][:end_date]
    if @date_ini == "" or @date_end == ""
      redirect_to reports_path, :notice => "Debes de llenar todos los campos"
    else
      @geoloc = County.select("cast(towns.state_id as char) || towns.county_id || towns.cve_loc as georef, counties.name as tnombre,
              sum(cast(activities.value as int)) as totalact").order("counties.name ").joins(:activities,:towns ).group("
              (cast(towns.state_id as char) || towns.county_id || towns.cve_loc),counties.name").where("counties.state_id = 8
              and towns.state_id = 8 and towns.name like '%*%' and activities.activity_date_start > :start_date and activities.activity_date_end < :end_date",
              {:start_date => (params[:start_date][:start_date]).to_date - 1, :end_date => (params[:end_date][:end_date]).to_date + 1})

      respond_to do |format|
        format.html # index.html.erb
        format.xls { send_data @geoloc.to_xls(:columns => [:georef, :tnombre, :totalact], :headers => ['Referencia','Localidad', 'Total Actividades']), content_type: 'application/vnd.ms-excel', filename: 'localidad_geo.xls' }
        format.json { render json: @geoloc }
      end
    end
  end
end