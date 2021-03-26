require 'rails_helper'

RSpec.describe Vote, type: :model do
  it 'belongs to a user' do
    should belong_to(:user)
  end

  it 'belongs to a article' do
    should belong_to(:article)
  end


  it 'is valid with a user' do
    @author = create(:user)
    @voter = create(:user)
    @category = create(:category)
    @article = create(:article, author_id: @author.id, category_id: @category.id)
    @vote = Vote.new(user_id: @voter.id, article_id: @article.id)
    expect(@vote).to be_valid
  end

  it 'is not valid without a user' do
    @author = create(:user)
    @category = create(:category)
    @article = create(:article, author_id: @author.id, category_id: @category.id)
    @vote = Vote.new(user_id: nil, article_id: @article.id)
    expect(@vote).to_not be_valid
  end

  it 'is valid with an article' do
    @author = create(:user)
    @voter = create(:user)
    @category = create(:category)
    @article = create(:article, author_id: @author.id, category_id: @category.id)
    @vote = Vote.new(user_id: @voter.id, article_id: @article.id)
    expect(@vote).to be_valid
  end

  it 'is not valid without an article' do
    @author = create(:user)
    @voter = create(:user)
    @category = create(:category)
    @vote = Vote.new(user_id: @voter.id, article_id: nil)
    expect(@vote).to_not be_valid
  end

  it 'is valid if unique for that user and article' do
    @author = create(:user)
    @voter = create(:user)
    @category = create(:category)
    @article = create(:article, author_id: @author.id, category_id: @category.id)
    @vote = Vote.new(user_id: @voter.id, article_id: @article.id)
    expect(@vote).to be_valid
  end

  it 'is not valid if the user already voted that article' do
    @author = create(:user)
    @voter = create(:user)
    @category = create(:category)
    @article = create(:article, author_id: @author.id, category_id: @category.id)
    create(:vote, user_id: @voter.id, article_id: @article.id) # the user is voting the article
    @vote = Vote.new(user_id: @voter.id, article_id: @article.id) # the user wants to vote again!!
    expect(@vote).to_not be_valid
  end

  it 'retrieves the count of votes grouped by article sorted in descending order' do
    @user1 = create(:user)
    @user2 = create(:user)
    @category1 = create(:category)
    @category2 = create(:category)
    @article1 = create(:article, author_id: @user1.id, category_id: @category1.id)
    @article2 = create(:article, author_id: @user2.id, category_id: @category2.id)
    create(:vote, user_id: @user1.id, article_id: @article1.id)
    create(:vote, user_id: @user1.id, article_id: @article2.id)
    create(:vote, user_id: @user2.id, article_id: @article2.id) # article2 gets 2 votes, article1 gets 1 vote
    expect(Vote.count_by_article.class).to eq(Hash)
    expect(Vote.count_by_article.keys[0]).to eq(@article2.id) 
    expect(Vote.count_by_article.values[0]).to be > Vote.count_by_article.values[1]
  end

  it 'retrieves the count of votes grouped by category' do
    @user1 = create(:user)
    @user2 = create(:user)
    @category1 = create(:category)
    @category2 = create(:category)
    @article1 = create(:article, author_id: @user1.id, category_id: @category1.id)
    @article2 = create(:article, author_id: @user2.id, category_id: @category2.id)
    create(:vote, user_id: @user1.id, article_id: @article1.id)
    create(:vote, user_id: @user1.id, article_id: @article2.id)
    create(:vote, user_id: @user2.id, article_id: @article2.id) # category2 gets 2 votes, category1 gets 1 vote
    expect(Vote.count_by_category.class).to eq(Hash)
    expect(Vote.count_by_category.keys[0]).to eq(@category2.id)
    expect(Vote.count_by_category.values[0]).to be > Vote.count_by_category.values[1]
  end
end
