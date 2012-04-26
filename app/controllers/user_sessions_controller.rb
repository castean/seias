class UserSessionsController < ApplicationController
  # This class has methods for manage user sessions.
  before_filter :authenticate, :only => :destroy

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])

    if @user_session.save
      respond_to do |format|
        format.html {redirect_to root_path}
      end
    else
      respond_to do |format|
        format.html {render :action => :new}
      end
    end

  end


  def destroy
    respond_to do |format|
      if current_user_session.destroy
        format.html {redirect_to new_user_sessions_path}
      else
        format.html{
          flash[:error] = "Hubo un problema al tratar de terminar sesion"
          redirect_to documents_url
        }
      end
    end
  end
end
