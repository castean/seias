class PedSubThemesController < ApplicationController
  load_and_authorize_resource
  # GET /ped_sub_themes
  # GET /ped_sub_themes.json
  def index
    @ped_sub_themes = PedSubTheme.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ped_sub_themes }
    end
  end

  # GET /ped_sub_themes/1
  # GET /ped_sub_themes/1.json
  def show
    @ped_sub_theme = PedSubTheme.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ped_sub_theme }
    end
  end

  # GET /ped_sub_themes/new
  # GET /ped_sub_themes/new.json
  def new
    @ped_sub_theme = PedSubTheme.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ped_sub_theme }
    end
  end

  # GET /ped_sub_themes/1/edit
  def edit
    @ped_sub_theme = PedSubTheme.find(params[:id])
  end

  # POST /ped_sub_themes
  # POST /ped_sub_themes.json
  def create
    @ped_sub_theme = PedSubTheme.new(params[:ped_sub_theme])

    respond_to do |format|
      if @ped_sub_theme.save
        format.html { redirect_to @ped_sub_theme, notice: 'Ped sub theme was successfully created.' }
        format.json { render json: @ped_sub_theme, status: :created, location: @ped_sub_theme }
      else
        format.html { render action: "new" }
        format.json { render json: @ped_sub_theme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ped_sub_themes/1
  # PUT /ped_sub_themes/1.json
  def update
    @ped_sub_theme = PedSubTheme.find(params[:id])

    respond_to do |format|
      if @ped_sub_theme.update_attributes(params[:ped_sub_theme])
        format.html { redirect_to @ped_sub_theme, notice: 'Ped sub theme was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ped_sub_theme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ped_sub_themes/1
  # DELETE /ped_sub_themes/1.json
  def destroy
    @ped_sub_theme = PedSubTheme.find(params[:id])
    @ped_sub_theme.destroy

    respond_to do |format|
      format.html { redirect_to ped_sub_themes_url }
      format.json { head :no_content }
    end
  end
end
