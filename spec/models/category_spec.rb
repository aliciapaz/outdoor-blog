require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @category = create(:category)
  end

  it 'should have many articles' do
    should have_many(:articles)
  end

  it 'is valid with a valid name' do
    @category.name = 'Valid name'
    expect(@category).to be_valid
  end

  it 'is not valid without a name' do
    @category.name = ''
    expect(@category).to_not be_valid
  end

  it 'is valid with a unique name' do
    @category.name = 'Unique name'
    @category2 = create(:category, name: 'Another unique name')
    expect(@category2).to be_valid
  end

  it 'is not valid without a unique name' do
    @category1 = Category.create(name: 'Name')
    @category2 = Category.new(name: 'Name')
    expect(@category2).to_not be_valid
  end

  it 'sets priority according to the number of votes' do
    @user1 = create(:user)
    @user2 = create(:user)
    @category1 = create(:category)
    @article1 = create(:article, author_id: @user1.id, category_id: @category.id)
    @article2 = create(:article, author_id: @user2.id, category_id: @category1.id)
    create(:vote, user_id: @user1.id, article_id: @article1.id)
    create(:vote, user_id: @user1.id, article_id: @article2.id)
    create(:vote, user_id: @user2.id, article_id: @article2.id) # category1 gets 2 votes, category gets 1 vote
    @votes = Vote.count_by_category
    @categories = Category.prioritize(@votes)
    @prioritized = @categories.order(:priority)
    expect(@prioritized.first.id).to eq(@category1.id)
  end
end
