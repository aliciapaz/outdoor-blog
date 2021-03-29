require 'rails_helper'

RSpec.feature 'Sign up' do
  before(:each) do
    100.times do
      create(:user)
    end

    4.times do
      create(:category)
    end

    16.times do
      create(:article)
    end

    100.times do |index| 
      create(:vote, user_id: index + 1)
    end
    init_driver
    visit root_path
  end

  after(:all) do
    quit_driver
  end

  it 'shows register button' do
    expect(page).to have_content('REGISTER')
  end

  it 'allows a user to register with a name' do
    visit signup_path
    fill_in 'user[name]', with: 'sponge bob'
    click_on 'Sign up'
    expect(page).to have_content('sponge bob')
  end
end