require 'rails_helper'

RSpec.describe Vote, type: :model do
  before(:all) do
    
  end
  it 'retrieves the count of votes grouped by article' do
    expect(self.count_by_article).to eq()
  end

  it 'retrieves the cout of votes grouped by category' do
  
  end
end
