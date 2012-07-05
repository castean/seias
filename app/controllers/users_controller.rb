#encoding:utf-8
class UsersController < ApplicationController
  load_and_authorize_resource

  #GET
  def index
    @users = User.order("name").order("last_name").order("second_last_name").page(params[:page]).per(20)
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  #POST
  def create
    @user = User.new(params[:user])
    @user.active = true
    unless  authentication_method_requires_password?
      @user.password = "dif123"
      @user.password_confirmation = "dif123"
    end
    if @user.save
      redirect_to users_path, notice: 'Usuario registrado correctamente'
    else
      render action: "new"
    end

  end

  #PUT
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to users_path, notice: 'Usuario registrado correctamente'
    else
      render action: "edit"
    end
  end


  #DELETE
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: 'Usuario eliminado correctamente'
  end

end
