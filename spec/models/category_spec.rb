require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:all) do
    4.times do
      create(:user)
    end

    4.times do
      create(:category)
    end

    16.times do
      create(:article)
    end

    100.times do
      create(:vote)
    end
  end

  it 'sets priority according to the number of votes' do
    @votes = Vote.count_by_category
    @category = Category.prioritize(@votes)
    @prioritized = @category.order(:priority)
    expect(@prioritized.first.priority).to eq(1)
    expect(@prioritized.second.priority).to eq(2)
    expect(@prioritized.third.priority).to eq(3)
  end
end
