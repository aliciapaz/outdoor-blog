require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'is valid with a title' do
    @author = create(:user)
    @category = create(:category)
    @article = Article.new(title: 'My bike trip to Patagonia',
                           text: Faker::Lorem.paragraph_by_chars(number: 15, supplemental: false),
                           image: ' ',
                           author_id: @author.id,
                           category_id: @category.id)
    expect(@article).to be_valid
  end

  it 'is not valid without a title' do
    @author = create(:user)
    @category = create(:category)
    @article = Article.new(title: '',
                           text: Faker::Lorem.paragraph_by_chars(number: 15, supplemental: false),
                           image: ' ',
                           author_id: @author.id,
                           category_id: @category.id)
    expect(@article).to_not be_valid
  end

  it 'is valid with text' do
    @author = create(:user)
    @category = create(:category)
    @article = Article.new(title: 'My bike trip to Patagonia',
                           text: Faker::Lorem.paragraph_by_chars(number: 15, supplemental: false),
                           image: ' ',
                           author_id: @author.id,
                           category_id: @category.id)
    expect(@article).to be_valid
  end

  it 'is not valid without text' do
    @author = create(:user)
    @category = create(:category)
    @article = Article.new(title: 'My bike trip to Patagonia',
                           text: '',
                           image: ' ',
                           author_id: @author.id,
                           category_id: @category.id)
    expect(@article).to_not be_valid
  end

  it 'is valid with an author' do
    @author = create(:user)
    @category = create(:category)
    @article = Article.new(title: 'My bike trip to Patagonia',
                           text: Faker::Lorem.paragraph_by_chars(number: 15, supplemental: false),
                           image: ' ',
                           author_id: @author.id,
                           category_id: @category.id)
    expect(@article).to be_valid
  end

  it 'is not valid without an author' do
    @category = create(:category)
    @article = Article.new(title: '',
                           text: Faker::Lorem.paragraph_by_chars(number: 15, supplemental: false),
                           image: ' ',
                           author_id: nil,
                           category_id: @category.id)
    expect(@article).to_not be_valid
  end

  it 'is valid with a category' do
    @author = create(:user)
    @category = create(:category)
    @article = Article.new(title: 'My bike trip to Patagonia',
                           text: Faker::Lorem.paragraph_by_chars(number: 15, supplemental: false),
                           image: ' ',
                           author_id: @author.id,
                           category_id: @category.id)
    expect(@article).to be_valid
  end

  it 'is not valid without a category' do
    @author = create(:user)
    @article = Article.new(title: '',
                           text: Faker::Lorem.paragraph_by_chars(number: 15, supplemental: false),
                           image: ' ',
                           author_id: @author.id,
                           category_id: nil)
    expect(@article).to_not be_valid
  end

  it 'returns the most voted article' do
    @author = create(:user)
    @category = create(:category)
    @article = create(:article, category_id: @category.id, author_id: @author.id)
    @votes = create(:vote, user_id: @author.id, article_id: @article.id)
    @votes_by_article = Vote.count_by_article
    expect(Article.most_popular(@votes_by_article).id).to eq(@article.id)
  end
end
