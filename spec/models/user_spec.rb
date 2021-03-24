require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a name' do
    expect(User.new(name: 'Sponge Bob')).to be_valid
  end

  it 'is not valid with a short name' do
    expect(User.new(name: 'B')).to_not be_valid
  end

  it 'is not valid with a long name' do
    expect(User.new(name: 'This is a very very very long name')).to_not be_valid
  end

  # it 'is not valid if not unique' do

  # end

  it 'normalizes a name' do
    @user = User.create(name: 'jAnE dOe')
    expect(@user.name).to eq('Jane Doe')
  end
end
