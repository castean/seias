#encoding:utf-8
class UsersController < ApplicationController
  load_and_authorize_resource
  
  def change_password

    @user = current_user

    if request.post?
      if @user.valid_password? params[:password][:old_password]
        @user.password = params[:password][:new_password]
        @user.password_confirmation = params[:password][:new_password_confirmation]
        if @user.save
          UserSession.create(:login => @user.login, :password => @user.password)
          redirect_to root_path , :notice => "Cambio de Contraseña Correcto"
        else
          flash[:error] = 'Verifique la Contraseña Nueva'
        end
      else
        flash[:error] = 'Contraseña Actual Invalida'
      end
    end
  end

  #GET
  def index
    @users = User.all
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
    if Seias::Application.config.ldap_auth
      @user.password = "123pum"
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
