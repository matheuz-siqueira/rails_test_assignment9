module SystemHelpers 
  def sign_up
    visit '/'
    click_on 'Sign Up'
    fill_in 'user-email', with: 'jdoe@email.com'
    fill_in 'user-password', with: 'secret123'
    click_on 'user-submit'
  end

  def sign_out 
    click_on 'sign-out'
  end

  def sign_in 
    visit '/'
    click_on 'sign-in'
    fill_in 'user-email', with: 'jdoe@email.com'
    fill_in 'user-password', with: 'secret123'
    click_on 'user-submit'
    expect(page).to have_content('Welcome jdoe@email.com')
  end
end