class RegistrationsController < ApplicationController 
  layout 'auth'

  def new
    @user = User.new 
  end 

  def create
    @user = User.new(user_params)

    if @user.save 
      flash[:notice] = "Welcome #{@user.email}"
      redirect_to root_path 
    end
  end 

  private 
    def user_params
      params.require(:user).permit(:email, :password) 
    end
end