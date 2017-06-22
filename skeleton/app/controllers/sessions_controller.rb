class SessionsController < ApplicationController

  def new
    render :new
  end

  def create

    user = User.find_by_credentials(params[:user_name], params[:password])
    if user.nil?
      # fail
      flash[:errors] = ["Invalid username or password"]
      # redirect_to new_session_url
      render :new
    else
      session[:session_token] = user.reset_session_token!
      redirect_to cats_url
    end

  end

  def destroy

  end

  private

  def session_params
    params.require(:session).permit(:user_name, :password)
  end
end
