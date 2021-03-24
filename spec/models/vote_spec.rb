require 'rails_helper'

RSpec.describe Vote, type: :model do
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

    5.times do
      create(:vote, article_id: '2')
    end
  end

  it 'retrieves the count of votes grouped by article sorted in descending order' do
    expect(Vote.count_by_article.class).to eq(Hash)
    expect(Vote.count_by_article.keys[0]).to eq(1)
    expect(Vote.count_by_article.values[0]).to be > Vote.count_by_article.values[1]
  end

  it 'retrieves the count of votes grouped by category' do
    expect(Vote.count_by_category.class).to eq(Hash)
    expect(Vote.count_by_category.keys[0].class).to eq(Integer)
    expect(Vote.count_by_category.values[0]).to be > Vote.count_by_category.values[1]
  end
end
