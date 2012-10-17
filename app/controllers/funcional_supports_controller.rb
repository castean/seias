class FuncionalSupportsController < ApplicationController
  # GET /funcional_supports
  # GET /funcional_supports.json
  def index
    @funcional_supports = FuncionalSupport.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @funcional_supports }
    end
  end

  # GET /funcional_supports/1
  # GET /funcional_supports/1.json
  def show
    @funcional_support = FuncionalSupport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @funcional_support }
    end
  end

  # GET /funcional_supports/new
  # GET /funcional_supports/new.json
  def new
    @funcional_support = FuncionalSupport.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @funcional_support }
    end
  end

  # GET /funcional_supports/1/edit
  def edit
    @funcional_support = FuncionalSupport.find(params[:id])
  end

  # POST /funcional_supports
  # POST /funcional_supports.json
  def create
    @funcional_support = FuncionalSupport.new(params[:funcional_support])

    respond_to do |format|
      if @funcional_support.save
        format.html { redirect_to @funcional_support, notice: 'Funcional support was successfully created.' }
        format.json { render json: @funcional_support, status: :created, location: @funcional_support }
      else
        format.html { render action: "new" }
        format.json { render json: @funcional_support.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /funcional_supports/1
  # PUT /funcional_supports/1.json
  def update
    @funcional_support = FuncionalSupport.find(params[:id])

    respond_to do |format|
      if @funcional_support.update_attributes(params[:funcional_support])
        format.html { redirect_to @funcional_support, notice: 'Funcional support was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @funcional_support.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funcional_supports/1
  # DELETE /funcional_supports/1.json
  def destroy
    @funcional_support = FuncionalSupport.find(params[:id])
    @funcional_support.destroy

    respond_to do |format|
      format.html { redirect_to funcional_supports_url }
      format.json { head :no_content }
    end
  end
end
