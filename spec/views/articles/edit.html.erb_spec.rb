require 'rails_helper'

RSpec.describe 'articles/edit', type: :view do
  before(:each) do
    @article = assign(:article, Article.create!(
                                  title: 'MyString',
                                  text: 'MyText',
                                  image: 'MyString',
                                  author: nil,
                                  category: nil
                                ))
  end

  it 'renders the edit article form' do
    render

    assert_select 'form[action=?][method=?]', article_path(@article), 'post' do
      assert_select 'input[name=?]', 'article[title]'

      assert_select 'textarea[name=?]', 'article[text]'

      assert_select 'input[name=?]', 'article[image]'

      assert_select 'input[name=?]', 'article[author_id]'

      assert_select 'input[name=?]', 'article[category_id]'
    end
  end
end
