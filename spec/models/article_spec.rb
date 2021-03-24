require 'rails_helper'

RSpec.describe Article, type: :model do
  before(:all) do
    4.times do
      create(:user)
    end

    4.times do
      create(:category)
    end

    2.times do
      create(:article)
    end

    10.times do
      create(:vote, article_id: '1')
    end
  end

  # validations

  # associations

  it 'returns the most voted article' do
    @votes_by_article = Vote.count_by_article
    expect(Article.most_popular(@votes_by_article).id).to eq(1)
  end
end
