require 'rails_helper'

RSpec.describe "Sessions", type: :system do 
    it 'allows users to sign in' do 
      sign_up
      sign_out
      sign_in
  end
end