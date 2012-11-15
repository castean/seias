class FunctionalSupportsController < ApplicationController
  # GET /functional_supports
  # GET /functional_supports.json
  def index
    @functionalsupports = FunctionalSupport.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @functionalsupports }
    end
  end

  # GET /functional_supports/1
  # GET /functional_supports/1.json
  def show
    @functionalsupport = FunctionalSupport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @functionalsupport }
    end
  end

  # GET /functional_supports/new
  # GET /functional_supports/new.json
  def new
    @functionalsupport = FunctionalSupport.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @functionalsupport }
    end
  end

  # GET /functional_supports/1/edit
  def edit
    @functionalsupport = FunctionalSupport.find(params[:id])
  end

  # POST /functional_supports
  # POST /functional_supports.json
  def create
    @functionalsupport = FunctionalSupport.new(params[:functional_support])

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

  # PUT /functional_supports/1
  # PUT /functional_supports/1.json
  def update
    @functionalsupport = FunctionalSupport.find(params[:id])

    respond_to do |format|
      if @functionalsupport.update_attributes(params[:functional_support])
        format.html { redirect_to @functionalsupport, notice: 'Funcional support was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @functionalsupport.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /functional_supports/1
  # DELETE /functional_supports/1.json
  def destroy
    @functionalsupport = FunctionalSupport.find(params[:id])
    @functionalsupport.destroy

    respond_to do |format|
      format.html { redirect_to funcional_supports_url }
      format.json { head :no_content }
    end
  end
end
