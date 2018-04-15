class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.password == params[:session][:password]
      log_in @user
      redirect_to user_path @user.id
    else
      
    
    end
  end

  def destroy
    log_out
    redirect_to '/'
  end
end
