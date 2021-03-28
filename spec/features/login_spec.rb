require 'rails_helper'

RSpec.feature 'Homepage' do
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
    get_driver
  end

  it 'shows login button' do
    visit root_path
    expect(page).to have_content('LOGIN')
  end
  it 'shows register button' do
    visit root_path
    expect(page).to have_content('REGISTER')
  end
end