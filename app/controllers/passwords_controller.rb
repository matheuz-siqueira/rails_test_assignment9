class PasswordsController < ApplicationController
  def new
  end 

  def create
    @user = User.find_by(email: params[:email])
    if @user
      PasswordRecoveryMailer.with(user: @user).recover.deliver_later
    else
      flash[:alert] = 'Error in request'
      render :edit, status: :unprocessable_entity 
    end 
  end

  def edit
  end 

  def update 
        
    @user = User.find_by(id: params[:id])
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation] 

    if @user.save
      flash[:notice] = 'Your password has been updated'
      redirect_to root_path
    else
      flash[:alert] = 'password cannot be updated'
      render :edit, status: :unprocessable_entity
    end
  end 


end
