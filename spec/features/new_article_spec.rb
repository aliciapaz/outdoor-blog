require 'rails_helper'

RSpec.feature 'Write an article' do
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
    visit login_path
    fill_in 'name', with: User.last.name
    click_on 'Login'
  end

  after(:all) do
    quit_driver
  end

  it 'shows write an article button' do
    expect(page).to have_content('WRITE AN ARTICLE')
  end

  it 'allows a logged in user to write an article' do
    visit new_article_path
    fill_in 'article[title]', with: 'My Capybara'
    fill_in 'article[text]', with: 'I am a capybara writer'
    fill_in 'article[image]', with: 'https://images.freeimages.com/images/large-previews/c9c/capybara-1335249.jpg'
    click_on 'Publish'
    expect(page).to have_content('My Capybara')
  end
end