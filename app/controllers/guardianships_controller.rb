class GuardianshipsController < ApplicationController
  # GET /guardianships
  # GET /guardianships.json
  def index
    @guardianships = Guardianship.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @guardianships }
    end
  end

  # GET /guardianships/1
  # GET /guardianships/1.json
  def show
    @guardianship = Guardianship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @guardianship }
    end
  end

  # GET /guardianships/new
  # GET /guardianships/new.json
  def new
    @guardianship = Guardianship.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @guardianship }
    end
  end

  # GET /guardianships/1/edit
  def edit
    @guardianship = Guardianship.find(params[:id])
  end

  # POST /guardianships
  # POST /guardianships.json
  def create
    @guardianship = Guardianship.new(params[:guardianship])

    respond_to do |format|
      if @guardianship.save
        format.html { redirect_to @guardianship, notice: 'Guardianship was successfully created.' }
        format.json { render json: @guardianship, status: :created, location: @guardianship }
      else
        format.html { render action: "new" }
        format.json { render json: @guardianship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /guardianships/1
  # PUT /guardianships/1.json
  def update
    @guardianship = Guardianship.find(params[:id])

    respond_to do |format|
      if @guardianship.update_attributes(params[:guardianship])
        format.html { redirect_to @guardianship, notice: 'Guardianship was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @guardianship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guardianships/1
  # DELETE /guardianships/1.json
  def destroy
    @guardianship = Guardianship.find(params[:id])
    @guardianship.destroy

    respond_to do |format|
      format.html { redirect_to guardianships_url }
      format.json { head :no_content }
    end
  end
end
