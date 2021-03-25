module CategoriesHelper
  def category_article(article, category)
    concat image_tag article.image, class: 'article-snippet-image'
    content_tag :div, class: 'article-snippet' do
      concat content_tag(:h2, category.name.titleize, class: 'article-snippet-category')
      concat link_to article.title, article, class: 'article-snippet-title'
      concat content_tag(:p, article.text[0..100], class: 'article-snippet-text')
      concat content_tag(:p, "By  #{User.find(article.author_id).name.titleize}", class: 'article-snippet-author')
    end
  end
end
