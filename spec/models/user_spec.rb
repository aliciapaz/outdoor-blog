require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = create(:user)
  end
    it 'is valid with a name' do
      expect(@user).to be_valid
    end

    it 'is not valid with a short name' do
      expect(User.new(name: 'B')).to_not be_valid
    end

    it 'is not valid with a long name' do
      expect(User.new(name: 'This is a very very very long name')).to_not be_valid
    end

    ## add callback test!!! 
end
