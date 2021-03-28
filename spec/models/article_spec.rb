require 'rails_helper'

RSpec.describe Article, type: :model do
  before(:each) do
    @author = create(:user)
    @category = create(:category, priority: 1)
    @article = Article.new(title: 'My bike trip to Patagonia',
                           text: Faker::Lorem.paragraph_by_chars(number: 15, supplemental: false),
                           image: 'https://images.freeimages.com/images/large-previews/8c5/grey-squirrel-1401263.jpg',
                           author_id: @author.id,
                           category_id: @category.id)
  end

  it 'should belong to an author' do
    should belong_to(:author).class_name('User')
  end

  it 'should belong to a category' do
    should belong_to(:category)
  end

  it 'should have many votes' do
    should have_many(:votes)
  end

  it 'should have many voters' do
    should have_many(:voters).through(:votes).class_name('User')
  end

  it 'is valid with a title' do
    @article.title = 'This is a vaid title'
    expect(@article).to be_valid
  end

  it 'is not valid without a title' do
    @article.title = ''
    expect(@article).to_not be_valid
  end

  it 'is valid with text' do
    @article.text = 'This is valid text'
    expect(@article).to be_valid
  end

  it 'is not valid without text' do
    @article.text = ''
    expect(@article).to_not be_valid
  end

  it 'is valid with an author' do
    @article.author_id = @author.id
    expect(@article).to be_valid
  end

  it 'is not valid without an author' do
    @article.author_id = nil
    expect(@article).to_not be_valid
  end

  it 'is valid with a category' do
    @article.category_id = @category.id
    expect(@article).to be_valid
  end

  it 'is not valid without a category' do
    @article.category_id = nil
    expect(@article).to_not be_valid
  end

  it 'is valid with a url of an image' do
    @article.image = 'https://images.freeimages.com/images/large-previews/8c5/grey-squirrel-1401263.jpg'
    expect(@article).to be_valid
  end

  it 'is valid with a url that does not end in jpg, png or gif' do
    @article.image = 'https://images.freeimages.com/images/large-previews/8c5/grey-squirrel-1401263'
    expect(@article).to_not be_valid
  end

  it 'returns the most voted article' do
    @author = create(:user)
    @article = create(:article, author_id: @author.id, category_id: @category.id)
    @votes = create(:vote, user_id: @author.id, article_id: @article.id)
    @votes_by_article = Vote.count_by_article
    expect(Article.most_popular(@votes_by_article).id).to eq(@article.id)
  end
end
