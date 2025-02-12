class SessionsController < ApplicationController
  skip_before_action :verify_user_is_authenticated, only: [:new,:create]
  def new
  end

  def create
    if @user = User.find_by(name:params[:user][:name])
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end
