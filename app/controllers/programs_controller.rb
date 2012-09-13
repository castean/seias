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

    if @date_ini == "" or @date_end == ""
      redirect_to programs_report_path, :notice => "Debes de llenar todos los campos"
    else
      if params[:finder][:program] == "program"

        @program = Program.select('programs.*, activity_types.description as nombre,sum(cast(activities.value as int)) as totalv, sum(activities.qty_men) as hombre,
                  sum(activities.qty_women) as mujer, sum(activities.qty_men) + sum(activities.qty_women) as totalp
                  ').joins(:critical_success_factors => {:activity_types => :activities }).group('activities.activity_type_id,programs.id,programs.description,programs.name,programs.department_id,programs.responsable_id,
                  programs.created_at,programs.updated_at,programs.direction_id,programs.cut_day,programs.start_date,activity_types.description').where("
                  programs.id = :program_id and activities.activity_date_start > :start_date and activities.activity_date_end < :end_date
                  ", {:program_id => params[:program_id][:program_id], :start_date => (params[:start_date][:start_date]).to_date - 1, :end_date => (params[:end_date][:end_date]).to_date + 1})
      elsif params[:finder][:program] == "pajs"
        @program = Program.select('programs.name as pnombre, programs.description pdescripcion, activity_types.description as anombre,judicial_districts.name dnombre,sum(cast(activities.value as int)) as totalv'
                          ).joins(:critical_success_factors => {:activity_types => {:activities => {:town => {:county => :judicial_districts}}}}).group('programs.name,
                    programs.description,activities.activity_type_id,
                    activity_types.description, judicial_districts.id,judicial_districts.name'
                    ).where("programs.id = :program_id and activities.activity_date_start > :start_date and activities.activity_date_end < :end_date ",
                    {:program_id => params[:program_id][:program_id], :start_date => (params[:start_date][:start_date]).to_date - 1, :end_date => (params[:end_date][:end_date]).to_date + 1})

      end

      respond_to do |format|
        format.html # index.html.erb

        if params[:finder][:program] == "program"
          format.xls { send_data @program.to_xls(:columns => [:name, :description, :nombre, :totalv, :hombre, :mujer, :totalp], :headers => ['Programa', 'Descripcion del Programa', 'Actividad','Total Valor','Hombres','Mujeres','Total Personas']), content_type: 'application/vnd.ms-excel', filename: 'programas.xls' }
        elsif params[:finder][:program] == "pajs"
          format.xls { send_data @program.to_xls(:columns => [:pnombre, :pdescripcion, :anombre, :dnombre,:totalv], :headers => ['Programa', 'Descripcion del Programa', 'Actividad','Distrito Judicial','Total de Actividades']), content_type: 'application/vnd.ms-excel', filename: 'distritos.xls' }
        end
        format.json { render json: @program }

      end
    end
  end
  def program_report_all
      @program = Program.select('programs.*, activity_types.description as nombre,sum(cast(activities.value as int)) as totalv, sum(activities.qty_men) as hombre,
                sum(activities.qty_women) as mujer, sum(activities.qty_men) + sum(activities.qty_women) as totalp
                ').joins(:critical_success_factors => {:activity_types => :activities }).group('activities.activity_type_id,programs.id,programs.description,programs.name,programs.department_id,programs.responsable_id,
                programs.created_at,programs.updated_at,programs.direction_id,programs.cut_day,programs.start_date,activity_types.description'
                ).where("activities.activity_date_start > :start_date and activities.activity_date_end < :end_date
                ", {:start_date => (params[:start_date][:start_date]).to_date - 1, :end_date => (params[:end_date][:end_date]).to_date + 1})
      respond_to do |format|

    format.html # index.html.erb
      format.xls { send_data @program.to_xls(:columns => [:description, :nombre, :totalv, :hombre, :mujer, :totalp], :headers => ['Programa', 'Actividad','Total Valor','Hombres','Mujeres','Total Personas']), content_type: 'application/vnd.ms-excel', filename: 'programs.xls' }

      format.json { render json: @program }

    end
  end
end