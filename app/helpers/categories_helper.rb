module CategoriesHelper
  def category_article(article, category)
    concat image_tag article.image, class: 'article-image'
    content_tag :div, class: 'article-snippet' do
      concat content_tag(:h3, category.name.titleize, class: 'article-snippet-category')
      concat content_tag(:h2, article.title, class: 'article-snippet-title')
      concat content_tag(:p, article.text.truncate_words(15, omission: '...'), class: 'article-snippet-text')
      concat content_tag(:p, "By  #{User.find(article.author_id).name.titleize}", class: 'article-snippet-author')
    end
  end
end
