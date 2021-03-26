require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'should have many articles' do
    should have_many(:articles)
  end

  it 'sets priority according to the number of votes' do
    @user1 = create(:user)
    @user2 = create(:user)
    @category1 = create(:category)
    @category2 = create(:category)
    @article1 = create(:article, author_id: @user1.id, category_id: @category1.id)
    @article2 = create(:article, author_id: @user2.id, category_id: @category2.id)
    create(:vote, user_id: @user1.id, article_id: @article1.id)
    create(:vote, user_id: @user1.id, article_id: @article2.id)
    create(:vote, user_id: @user2.id, article_id: @article2.id) # category2 gets 2 votes, category1 gets 1 vote
    @votes = Vote.count_by_category
    @category = Category.prioritize(@votes)
    @prioritized = @category.order(:priority)
    expect(@prioritized.first.id).to eq(@category2.id)
  end
end
