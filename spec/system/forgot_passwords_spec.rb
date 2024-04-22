require 'rails_helper'
require 'action_mailer'

include EmailSpec::Helpers
# include ActiveJob::TestHelper

RSpec.describe "PasswordsController", type: :system do

  before do
    driven_by(:selenium, using: :chrome, screen_size: [1400, 1400])
  end

  before do 
    sign_up
  end

  it 'allow the user to recover their password' do 

    visit '/'  
    click_on 'user-login'
    click_on 'forgot-password' 
    fill_in 'user-email', with: 'jdoe@email.com'
    click_on 'user-email-submit'
    
    binding.pry
    sent_email = last_email_sent
    

    open_email("jdoe@gmail.com", with_subject: "Password recovery")
    expect(sent_email).to be_present


    visit_in_email("New password")
    expect(page).to have_text("Enter your new password")

    fill_in "user-password", with: "123secret"
    fill_in "user-password-confirmation", with: "123secret"
    click_on "update-password-submit"

    expect(page).to have_text("Your password has been updated")

    sign_in    

    expect(page).to have_content('Welcome jdoe@email.com')
  end
end
