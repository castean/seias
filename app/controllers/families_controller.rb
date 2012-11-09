class FamiliesController < ApplicationController
  load_and_authorize_resource
  #autocomplete :person, :name, :extra_data => [:last_name],:full => :false
  def add_family
    @person = Person.find(params[:person_id])
    @family = Family.new(:person_id => params[:person_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @family }
    end
  end
  def edit
    @family = Family.find(params[:id])
  end

  def create
    @family = Family.new(params[:family])

    respond_to do |format|
      if @family.save
        format.html { redirect_to "/families/add_family/#{params[:family][:person_id]}", notice: 'El familiar se agrego satisfactoriamente' }
        format.json { render json: @family, status: :created, location: "/families/add_family/#{params[:family][:person_id]}" }
      else
        format.html { render action: "new" }
        format.json { render json: @family.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @family = Family.find(params[:id])
    @family.destroy

    respond_to do |format|
      format.html { redirect_to "/families/add_family/#{@family.person_id}", notice: 'Se quito la relacion familiar satisfactoriamente' }
      format.json { head :no_content }
    end
  end
  def for_search
    @relatives = Person.where("LOWER(name) like '%#{params[:kin_name].downcase}%' and LOWER(last_name) like '%#{params[:kin_last_name].downcase}%' and LOWER(second_last_name) like '%#{params[:kin_second_last_name].downcase}%'").sort_by{ |k| k['name'] }
    respond_to do |format|
      format.json  { render :json => @relatives }
    end
  end
  def autocomplete_name
    term = params[:term]
    if term && !term.empty?
      items = Person.select("distinct name").
          where("LOWER(name) like  '%#{term.downcase}%'").
          limit(10).order(:name)
    else
      items = {}
    end
    render :json => json_for_autocomplete(items, :name)
  end
  def autocomplete_last_name
    term = params[:term]
    if term && !term.empty?
      items = Person.select("distinct last_name").
          where("LOWER(last_name) like  '%#{term.downcase}%'").
          limit(10).order(:last_name)
    else
      items = {}
    end
    render :json => json_for_autocomplete(items, :last_name)
  end
  def autocomplete_second_last_name
    term = params[:term]
    if term && !term.empty?
      items = Person.select("distinct second_last_name").
          where("LOWER(second_last_name) like '%#{term.downcase}%'").
          limit(10).order(:second_last_name)
    else
      items = {}
    end
    render :json => json_for_autocomplete(items, :second_last_name)
  end
end