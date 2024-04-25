class SessionsController < ApplicationController
  before_action :user, only: %i[create destory]
  
  def create  
    if user.nil? 
      redirect_to sign_in_path, alert: 'Email or password incorret.'
    else 
      email = params[:email]
      if @user then session[:user] = user.id end  
      flash[:notice] = "Welcome #{email}"
      redirect_to root_path
    end
  end
  
  def destroy
    if session[:user]
      session.delete(:user) 
      redirect_to root_path
    end 
  end 

  private 
    def user 
      @user = User.find_by(email: params[:email])
        &.authenticate(params[:password])
    end

end 