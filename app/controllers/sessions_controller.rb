class SessionsController < ApplicationController
  def new
    if current_user
        redirect_to '/'
    end
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to '/'
    else
        flash[:error] = 'Your email or password is incorrect!'
        redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
