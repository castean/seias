class TypePeopleController < ApplicationController
  # GET /type_people
  # GET /type_people.json
  def index
    @type_people = TypePerson.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @type_people }
    end
  end

  # GET /type_people/1
  # GET /type_people/1.json
  def show
    @type_person = TypePerson.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @type_person }
    end
  end

  # GET /type_people/new
  # GET /type_people/new.json
  def new
    @type_person = TypePerson.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @type_person }
    end
  end

  # GET /type_people/1/edit
  def edit
    @type_person = TypePerson.find(params[:id])
  end

  # POST /type_people
  # POST /type_people.json
  def create
    @type_person = TypePerson.new(params[:type_person])

    respond_to do |format|
      if @type_person.save
        format.html { redirect_to @type_person, notice: 'Type person was successfully created.' }
        format.json { render json: @type_person, status: :created, location: @type_person }
      else
        format.html { render action: "new" }
        format.json { render json: @type_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /type_people/1
  # PUT /type_people/1.json
  def update
    @type_person = TypePerson.find(params[:id])

    respond_to do |format|
      if @type_person.update_attributes(params[:type_person])
        format.html { redirect_to @type_person, notice: 'Type person was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @type_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_people/1
  # DELETE /type_people/1.json
  def destroy
    @type_person = TypePerson.find(params[:id])
    @type_person.destroy

    respond_to do |format|
      format.html { redirect_to type_people_url }
      format.json { head :no_content }
    end
  end
end
