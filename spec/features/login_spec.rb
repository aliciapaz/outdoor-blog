require 'rails_helper'

RSpec.feature 'Login' do
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

  it 'shows login button' do
    expect(page).to have_content('LOGIN')
  end

  it 'allows a user to login with a registrated name' do
    visit login_path
    fill_in 'name', with: User.last.name
    click_on 'Login'
    expect(page).to have_content(User.last.name)
  end
end
