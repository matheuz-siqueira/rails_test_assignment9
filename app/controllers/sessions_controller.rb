class SessionsController < ApplicationController
  

  def create  
    email = params[:email]
    flash[:notice] = "Welcome #{email}" 
    redirect_to root_path 
  end
  
  def destroy
    current_user = nil 
    redirect_to sign_out_path 
  end 

  private 
    def user 
      User.find_by(email: params[:email])
        &.authenticate(params[:password])
    end

end 