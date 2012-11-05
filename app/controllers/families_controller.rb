class FamiliesController < ApplicationController
  load_and_authorize_resource
  def add_family
    @person = Person.find(params[:person_id])
    @family = Family.new(:person_id => params[:person_id])

    @search = Person.search(params[:q])
    @people = @search.result



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
end