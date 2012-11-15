#encoding:utf-8
class DepartmentsController < ApplicationController
  load_and_authorize_resource
  # GET /departments
  # GET /departments.json
  def index
    @departments = Department.order("direction_id","name").all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @departments }
    end
  end

  # GET /departments/1
  # GET /departments/1.json
  def show
    @department = Department.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @department }
    end
  end

  # GET /departments/new
  # GET /departments/new.json
  def new
    @department = Department.new()

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @department }
    end
  end

  # GET /departments/1/edit
  def edit
    @department = Department.find(params[:id])
  end

  # POST /departments
  # POST /departments.json
  def create
    @department = Department.new(params[:department])

    respond_to do |format|
      if @department.save
        format.html { redirect_to @department, notice: 'Department was successfully created.' }
        format.json { render json: @department, status: :created, location: @department }
      else
        format.html { render action: "new" }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /departments/1
  # PUT /departments/1.json
  def update
    @department = Department.find(params[:id])

    respond_to do |format|
      if @department.update_attributes(params[:department])
        format.html { redirect_to @department, notice: 'Department was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    @department = Department.find(params[:id])
    @department.destroy

    respond_to do |format|
      format.html { redirect_to departments_url }
      format.json { head :no_content }
    end
  end
  
  def for_directionid
      #@departments = SubSection.find( :all, :conditions => [" section_id = ?", params[:id]]  ).sort_by{ |k| k['name'] }
      @departments = Department.find_all_by_direction_id( params[:id]).sort_by{ |k| k['name'] }    
      respond_to do |format|
        format.json  { render :json => @departments }      
      end
     end

     def for_programid
      #@towns = Town.find_all_by_county_id( params[:id]).sort_by{ |k| k['name'] }
      @sql = "SELECT priority_program_action_lines.name, priority_program_action_lines.id  FROM priority_program_action_lines
    INNER JOIN priority_program_action_lines_programs ON priority_program_action_lines.id = priority_program_action_lines_programs.priority_program_action_line_id
    WHERE priority_program_action_lines_programs.program_id = " + params[:program_id]

    @ppal = ActiveRecord::Base.connection.select_rows(@sql)

    @ppal.map{|name, id|}
    #@ppal = PriorityProgramActionLines.where( :program_id => params[:id])
      respond_to do |format|
        format.json  { render :json => @ppal }
      end
    end
end
