class PedThemesController < ApplicationController
  load_and_authorize_resource
  # GET /ped_themes
  # GET /ped_themes.json
  def index
    @ped_themes = PedTheme.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ped_themes }
    end
  end

  # GET /ped_themes/1
  # GET /ped_themes/1.json
  def show
    @ped_theme = PedTheme.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ped_theme }
    end
  end

  # GET /ped_themes/new
  # GET /ped_themes/new.json
  def new
    @ped_theme = PedTheme.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ped_theme }
    end
  end

  # GET /ped_themes/1/edit
  def edit
    @ped_theme = PedTheme.find(params[:id])
  end

  # POST /ped_themes
  # POST /ped_themes.json
  def create
    @ped_theme = PedTheme.new(params[:ped_theme])

    respond_to do |format|
      if @ped_theme.save
        format.html { redirect_to @ped_theme, notice: 'Ped theme was successfully created.' }
        format.json { render json: @ped_theme, status: :created, location: @ped_theme }
      else
        format.html { render action: "new" }
        format.json { render json: @ped_theme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ped_themes/1
  # PUT /ped_themes/1.json
  def update
    @ped_theme = PedTheme.find(params[:id])

    respond_to do |format|
      if @ped_theme.update_attributes(params[:ped_theme])
        format.html { redirect_to @ped_theme, notice: 'Ped theme was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ped_theme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ped_themes/1
  # DELETE /ped_themes/1.json
  def destroy
    @ped_theme = PedTheme.find(params[:id])
    @ped_theme.destroy

    respond_to do |format|
      format.html { redirect_to ped_themes_url }
      format.json { head :no_content }
    end
  end
end
