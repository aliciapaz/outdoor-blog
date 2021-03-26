require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should have many articles' do
    should have_many(:articles)
  end

  it 'should have many votes' do
    should have_many(:votes)
  end

  it 'should have many voted articles' do
    should have_many(:voted_articles).through(:votes).class_name('Article')
  end

  it 'is valid with a name' do
    expect(User.new(name: 'Sponge Bob')).to be_valid
  end

  it 'is not valid with a short name' do
    expect(User.new(name: 'B')).to_not be_valid
  end

  it 'is not valid with a long name' do
    expect(User.new(name: 'This is a very very very long name')).to_not be_valid
  end

  it 'is valid if the name unique' do
    expect(User.new(name: 'Mr. Unique')).to be_valid
  end

  it 'is not valid if the name is not unique' do
    create(:user, name: 'Mr. Not Unique')
    expect(User.new(name: 'Mr. Not Unique')).to_not be_valid
  end

  it 'normalizes a name' do
    @user = User.create(name: 'jAnE dOe')
    expect(@user.name).to eq('jane doe')
  end
end
