require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    16.times do
      create(:user)
    end
  
    4.times do
      create(:category)
    end

    4.times do
      create(:article, author_id: 1, category_id: rand(1..4))
    end
  
    16.times do |index|
      Vote.create(user_id: index + 1, article_id: rand(1..4))
    end
  end

  it 'sets priority according to the number of votes' do
    @votes = Vote.count_by_category
    @category = Category.prioritize(@votes)
    @prioritized = @category.order(:priority)
    expect(@prioritized.first.priority).to eq(1)
  end
end
