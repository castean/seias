class FunctionalSupportsController < ApplicationController
  # GET /FunctionalSupports
  # GET /FunctionalSupports.json
  def index
    @functionalsupports = FunctionalSupport.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @functionalsupports }
    end
  end

  # GET /FunctionalSupports/1
  # GET /FunctionalSupports/1.json
  def show
    @functionalsupport = FunctionalSupport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @functionalsupport }
    end
  end

  # GET /FunctionalSupports/new
  # GET /FunctionalSupports/new.json
  def new
    @functionalsupport = FunctionalSupport.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @functionalsupport }
    end
  end

  # GET /FunctionalSupports/1/edit
  def edit
    @functionalsupport = FunctionalSupport.find(params[:id])
  end

  # POST /FunctionalSupports
  # POST /FunctionalSupports.json
  def create
    @functionalsupport = FunctionalSupport.new(params[:functionalsupport])

    respond_to do |format|
      if @functionalsupport.save
        format.html { redirect_to @functionalsupport, notice: 'Funcional support was successfully created.' }
        format.json { render json: @functionalsupport, status: :created, location: @functionalsupport }
      else
        format.html { render action: "new" }
        format.json { render json: @functionalsupport.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /FunctionalSupports/1
  # PUT /FunctionalSupports/1.json
  def update
    @functionalsupport = FunctionalSupport.find(params[:id])

    respond_to do |format|
      if @functionalsupport.update_attributes(params[:functionalsupport])
        format.html { redirect_to @functionalsupport, notice: 'Funcional support was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @functionalsupport.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /FunctionalSupports/1
  # DELETE /FunctionalSupports/1.json
  def destroy
    @functionalsupport = FunctionalSupport.find(params[:id])
    @functionalsupport.destroy

    respond_to do |format|
      format.html { redirect_to funcional_supports_url }
      format.json { head :no_content }
    end
  end
end
