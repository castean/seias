#encoding:utf-8
class ReportsController < ApplicationController
  load_and_authorize_resource

  def program_report
    #@program = Program.find(params[:id])
    @date_ini =  params[:start_date][:start_date]
    @date_end =  params[:end_date][:end_date]
    @prog_type = params[:finder][:qty]
    if @date_ini == "" or @date_end == ""
      redirect_to reports_path, :notice => "Debes de llenar todos los campos"
    elsif @prog_type == "all"
      redirect_to reports_program_report_all_path(request.parameters)
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
        ).order("judicial_districts.name, activity_types.name").joins(:critical_success_factors => {:activity_types => {:activities => {:town => {:county => :judicial_districts}}}}).group('programs.name,
                    programs.description,activities.activity_type_id,activity_types.name,
                    activity_types.description, judicial_districts.id,judicial_districts.name'
        ).where("programs.id = :program_id and activities.activity_date_start > :start_date and activities.activity_date_end < :end_date ",
                {:program_id => params[:program_id][:program_id], :start_date => (params[:start_date][:start_date]).to_date - 1, :end_date => (params[:end_date][:end_date]).to_date + 1})
      elsif params[:finder][:program] == "reg"

        if params[:finder][:region] == "one"
          @program = Program.select('programs.*, activity_types.name as anombre, activity_types.description as ndesc,sum(cast(activities.value as int)) as totalv, sum(activities.qty_men) as hombre,
                  sum(activities.qty_women) as mujer, sum(activities.qty_men) + sum(activities.qty_women) as totalp, regions.name as dnombre
                  ').joins(:critical_success_factors => {:activity_types => {:activities => {:town => {:county => :regions}}} }).group('activities.activity_type_id,programs.id,programs.description,programs.name,programs.department_id,
                  programs.responsable_id,programs.created_at,programs.updated_at,programs.direction_id,programs.cut_day,programs.program_start_date,activity_types.name,activity_types.description
                  ,regions.name').where("
                  programs.id = :program_id and activities.activity_date_start > :start_date and activities.activity_date_end < :end_date and regions.id = :region_id
                  ", {:program_id => params[:program_id][:program_id], :start_date => (params[:start_date][:start_date]).to_date - 1, :end_date => (params[:end_date][:end_date]).to_date + 1, :region_id => params[:region_id][:region_id]})

        elsif params[:finder][:region] == "all"
          @program = Program.select('programs.name, programs.description, activity_types.name as anombre, activity_types.description as ndesc,regions.name dnombre,sum(cast(activities.value as int)) as totalv'
          ).order("regions.name, activity_types.name").joins(:critical_success_factors => {:activity_types => {:activities => {:town => {:county => :regions}}}}).group('programs.name,
                    programs.description,activities.activity_type_id,activity_types.name,
                    activity_types.description, regions.id,regions.name'
          ).where("programs.id = :program_id and activities.activity_date_start > :start_date and activities.activity_date_end < :end_date ",
                  {:program_id => params[:program_id][:program_id], :start_date => (params[:start_date][:start_date]).to_date - 1, :end_date => (params[:end_date][:end_date]).to_date + 1})
        end
      end

      respond_to do |format|
        format.html # index.html.erb

        if params[:finder][:program] == "program"
          format.xls { send_data @program.to_xls(:columns => [:name, :description, :anombre, :ndesc, :totalv, :hombre, :mujer, :totalp], :headers => ['Programa', 'Descripcion del Programa', 'Actividad', 'Descripcion Actividad','Total Cantidades','Hombres','Mujeres','Total Personas']), content_type: 'application/vnd.ms-excel', filename: 'programas.xls' }
        elsif params[:finder][:program] == "pajs"
          format.xls { send_data @program.to_xls(:columns => [:pnombre, :pdescripcion, :anombre, :ndesc, :dnombre,:totalv], :headers => ['Programa', 'Descripcion del Programa', 'Actividad', 'Descripcion Actividad','Distrito Judicial','Total de Actividades']), content_type: 'application/vnd.ms-excel', filename: 'distritos.xls' }
        elsif params[:finder][:program] == "reg"
          if params[:finder][:region] == "one"
            format.xls { send_data @program.to_xls(:columns => [:dnombre,:name, :description, :anombre, :ndesc,  :totalv, :mujer, :hombre, :totalp], :headers => ['Region','Programa', 'Descripcion del Programa', 'Actividad','Descripcion Actividad','Cantidad de Actividades','Mujeres Beneficiadas','Hombres Beneficiados','Total de Beneficiarios']), content_type: 'application/vnd.ms-excel', filename: 'programa_region.xls' }
          elsif params[:finder][:region] == "all"
            format.xls { send_data @program.to_xls(:columns => [:name, :description, :anombre, :ndesc, :dnombre, :totalv], :headers => ['Programa', 'Descripcion del Programa', 'Actividad','Descripcion Actividad','Region','Total General']), content_type: 'application/vnd.ms-excel', filename: 'programa_todas_regiones.xls' }
          end
        end
        format.json { render json: @program }

      end
    end
  end
  def program_report_all
    @prog_type_rep = params[:finder][:program]
    case @prog_type_rep
      when 'program'; @program = Program.select('programs.*, activity_types.name as anombre, activity_types.description as ndesc,sum(cast(activities.value as int)) as totalv, sum(activities.qty_men) as hombre,
                sum(activities.qty_women) as mujer, sum(activities.qty_men) + sum(activities.qty_women) as totalp
                ').joins(:critical_success_factors => {:activity_types => :activities }).group('activities.activity_type_id,programs.id,programs.description,programs.name,programs.department_id,programs.responsable_id,
                programs.created_at,programs.updated_at,programs.direction_id,programs.cut_day,programs.program_start_date,activity_types.name,activity_types.description'
      ).where("activities.activity_date_start > :start_date and activities.activity_date_end < :end_date
                ", {:start_date => (params[:start_date][:start_date]).to_date - 1, :end_date => (params[:end_date][:end_date]).to_date + 1})

      when 'pajs'; @program = Program.select('programs.name as pnombre, programs.description pdescripcion, activity_types.name as anombre, activity_types.description as ndesc,judicial_districts.name dnombre,sum(cast(activities.value as int)) as totalv'
      ).order("judicial_districts.name, programs.name").joins(:critical_success_factors => {:activity_types => {:activities => {:town => {:county => :judicial_districts}}}}).group('programs.name,
                    programs.description,activities.activity_type_id,activity_types.name,
                    activity_types.description, judicial_districts.id,judicial_districts.name'
      ).where("activities.activity_date_start > :start_date and activities.activity_date_end < :end_date ",
              {:start_date => (params[:start_date][:start_date]).to_date - 1, :end_date => (params[:end_date][:end_date]).to_date + 1})

      when 'reg';
        if params[:finder][:region] == "one"
          @program = Program.select('programs.name, programs.description, activity_types.name as anombre, activity_types.description as ndesc,regions.name dnombre,sum(cast(activities.value as int)) as totalv,
                                    sum(activities.qty_men) as hombre, sum(activities.qty_women) as mujer, sum(activities.qty_men) + sum(activities.qty_women) as totalp'
          ).order("regions.name, activity_types.name").joins(:critical_success_factors => {:activity_types => {:activities => {:town => {:county => :regions}}}}).group('programs.name,
                    programs.description,activities.activity_type_id,activity_types.name,
                    activity_types.description, regions.id,regions.name'
          ).where("activities.activity_date_start > :start_date and activities.activity_date_end < :end_date and regions.id = :region_id",
                  {:start_date => (params[:start_date][:start_date]).to_date - 1, :end_date => (params[:end_date][:end_date]).to_date + 1, :region_id => params[:region_id][:region_id]})
        elsif params[:finder][:region] == "all"
          @program = Program.select('programs.name, programs.description, activity_types.name as anombre, activity_types.description as ndesc,regions.name dnombre,sum(cast(activities.value as int)) as totalv'
          ).order("regions.name, activity_types.name").joins(:critical_success_factors => {:activity_types => {:activities => {:town => {:county => :regions}}}}).group('programs.name,
                    programs.description,activities.activity_type_id,activity_types.name,
                    activity_types.description, regions.id,regions.name'
          ).where("activities.activity_date_start > :start_date and activities.activity_date_end < :end_date ",
                  {:start_date => (params[:start_date][:start_date]).to_date - 1, :end_date => (params[:end_date][:end_date]).to_date + 1})
        end

    end
    respond_to do |format|
      format.html # index.html.erb
      case @prog_type_rep
        when 'program'; format.xls { send_data @program.to_xls(:columns => [:name, :description, :anombre, :ndesc, :totalv, :hombre, :mujer, :totalp], :headers => ['Programa', 'Descripcion del Programa', 'Actividad','Descripcion Actividad','Total Cantidades','Hombres','Mujeres','Total Personas']), content_type: 'application/vnd.ms-excel', filename: 'todos_programas.xls' }
        when 'pajs'; format.xls { send_data @program.to_xls(:columns => [:pnombre, :pdescripcion, :anombre, :ndesc, :dnombre,:totalv], :headers => ['Programa', 'Descripcion del Programa', 'Actividad','Descripcion Actividad','Distrito Judicial','Total de Actividades']), content_type: 'application/vnd.ms-excel', filename: 'todos_distritos.xls' }
        when 'reg';
          if params[:finder][:region] == "one"
            format.xls { send_data @program.to_xls(:columns => [:dnombre,:name, :description, :anombre, :ndesc, :totalv, :mujer, :hombre, :totalp], :headers => ['Region','Programa','Descripcion del Programa', 'Actividad','Descripcion Actividad','Cantidad de Actividades','Mujeres Beneficiadas','Hombres Beneficiados','Total de Beneficiarios']), content_type: 'application/vnd.ms-excel', filename: 'todos_programas_region.xls' }
          elsif params[:finder][:region] == "all"
            format.xls { send_data @program.to_xls(:columns => [:dnombre,:name, :description, :anombre, :ndesc, :totalv], :headers => ['Region','Programa','Descripcion del Programa', 'Actividad','Descripcion Actividad','Total General']), content_type: 'application/vnd.ms-excel', filename: 'todos_programas_todas_regiones.xls' }
          end
      end
      format.json { render json: @program }
    end
  end

  def program_report_county
    @prog_type = params[:finder][:qty]
    @para = params[:month_part]
    @months = 0
    case @para
      when '1'; @months = 1,2,3
      when '2'; @months = 4,5,6
      when '3'; @months = 7,8,9
      when '4'; @months = 10,11,12
    end
    if @prog_type == "one"
      @program = Program.select("programs.name as pnombre, programs.description as pdescripcion, activity_types.name as anombre, activity_types.description as ndesc,
                sum(cast(activities.value as int)) as totalv, sum(activities.qty_men) + sum(activities.qty_women) as totalp,
                to_char(activities.activity_date_start,'Month') as mes, counties.name as mun
               ").order("activities.county_id,date_part('month', activities.activity_date_start),programs.name ").joins(:critical_success_factors => {:activity_types => {:activities => :county}}
                ).group("programs.name,programs.description,activity_types.name, activity_types.description,
                counties.name, activities.county_id, to_char(activities.activity_date_start,'Month'),date_part('month', activities.activity_date_start)
                ").where("counties.state_id = 8 and activities.county_id = :county_id and date_part('year',activities.activity_date_start) = :start_date",
                {:county_id =>params[:county_id][:cve_mun] ,:start_date => params[:date][:year]})
    elsif  @prog_type == "all"
      @program = Program.select("programs.name as pnombre, programs.description pdescripcion, activity_types.name as anombre, activity_types.description as ndesc,
                sum(cast(activities.value as int)) as totalv,
               sum(activities.qty_men) + sum(activities.qty_women) as totalp, to_char(activities.activity_date_start,'Month') as mes, counties.name as mun
               ").order("activities.county_id,date_part('month', activities.activity_date_start) ").joins(:critical_success_factors => {:activity_types => {:activities => :county}}).group("activities.activity_type_id,programs.id,programs.description,programs.name,programs.department_id,programs.responsable_id,
               programs.created_at,programs.updated_at,programs.direction_id,programs.cut_day,programs.program_start_date,activity_types.name, activity_types.description,
                to_char(activities.activity_date_start,'Month'),date_part('month', activities.activity_date_start),activities.county_id,counties.name,to_char(activities.activity_date_start, 'YYYY-MM-DD')").where("
                counties.state_id = 8 and date_part('year',activities.activity_date_start) = :start_date and
                date_part('month',activities.activity_date_start) in (:month)", {:start_date => params[:date][:year], :month => @months})
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xls { send_data @program.to_xls(:columns => [:pnombre, :pdescripcion, :anombre, :ndesc, :totalv, :totalp, :mun, :mes], :headers => ['Programa', 'Descripcion del Programa', 'Actividad','Descripcion Actividad','Total Actividades','Beneficiados','Municipio', 'Mes']), content_type: 'application/vnd.ms-excel', filename: 'programas_municipios.xls' }
      format.json { render json: @program }
    end
  end

  def report_town_act
    @date_ini =  params[:start_datec][:start_datec]
    @date_end =  params[:end_datec][:end_datec]
    if @date_ini == "" or @date_end == ""
      redirect_to reports_path, :notice => "Debes de llenar todos los campos"
    else
      @geoloc = Town.select("cast(towns.state_id as char) || lpad(towns.county_id::text,3,'0') || lpad(towns.cve_loc::text, 4, '0') as georef, towns.name as tnombre,
              sum(cast(activities.value as int)) as totalact, sum(activities.qty_men) + sum(activities.qty_women) as totalp, programs.name as pname, programs.description as pdescription").order("towns.name ").joins(:activities => {:activity_type => {:critical_success_factors => :program}} ).group("
              towns.name,cast(towns.state_id as char) || lpad(towns.county_id::text,3,'0') || lpad(towns.cve_loc::text, 4, '0'),programs.name,programs.description").where("towns.state_id = 8
              and towns.state_id = 8 and activities.activity_date_start > :start_date and activities.activity_date_end < :end_date
              and programs.id = :program_id",
              {:start_date => (params[:start_datec][:start_datec]).to_date - 1, :end_date => (params[:end_datec][:end_datec]).to_date + 1, :program_id => params[:program_id][:program_id]})

        if @geoloc.first.nil?
          redirect_to reports_path, :notice => "No existe información con el criterio de busqueda"

      else
      respond_to do |format|
        format.html # index.html.erb
        format.xls { send_data @geoloc.to_xls(:columns => [:georef, :tnombre, :totalact, :totalp], :headers => ['Referencia','Localidad', 'Total de apoyos', 'Total de beneficiarios']), content_type: 'application/vnd.ms-excel', filename: 'localidad_geo'+ @geoloc.first.pname + '_'+ @geoloc.first.pdescription + '.xls' }
        format.json { render json: @geoloc }
      end
        end
    end
  end

  def test1
    obj1 = Order.new(:city => 'London', :quarter => 'Q1')
    obj2 = Order.new(:city => 'London', :quarter => 'Q2')
    obj3 = Order.new(:city => 'London', :quarter => 'Q3')
    obj4 = Order.new(:city => 'London', :quarter => 'Q4')
    obj5 = Order.new(:city => 'New York', :quarter => '01')
    obj6 = Order.new(:city => 'New York', :quarter => '02')
    obj7 = Order.new(:city => 'New York', :quarter => '03')
    obj8 = Order.new(:city => 'New York', :quarter => '04')

    data = [obj1,obj2,obj3,obj4,obj5,obj6,obj7,obj8]

    grid = PivotTable::Grid.new do |g|
      g.source_data = data
      g.column_name = :quarter
      g.row_name = :city
    end

    g.build

  end

end