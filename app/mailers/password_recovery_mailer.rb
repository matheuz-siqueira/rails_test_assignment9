class PasswordRecoveryMailer < ApplicationMailer

  default from: 'from@example.com'

  def recover 
    @user = params[:user]
    mail(to: @user.email, subject: 'Password recovery')
  end


end
