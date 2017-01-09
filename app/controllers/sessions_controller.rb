class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      flash[:notice] = 'Log in successful'
      session[:user_id] = user.id
      redirect_to :root
    else
      flash[:notice] = 'Log in failed'
      redirect_to :login
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :login
  end
end
