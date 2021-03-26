require 'rails_helper'

RSpec.describe 'articles/show', type: :view do
  before(:each) do
    @author = create(:user)
    @category = create(:category)
    @article = assign(:article, Article.create!(
                                  title: 'Title',
                                  text: 'MyText',
                                  image: '',
                                  author: @author,
                                  category: @category
                                ))
  end

  it 'renders attributes in form' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
