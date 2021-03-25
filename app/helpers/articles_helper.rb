module ArticlesHelper
  def article_item(article)
    concat link_to Category.find(article.category_id).name.titleize, category_path(Category.find(article.category_id)), class: 'category-title'
    concat image_tag article.image, class: 'category-article-image'
    link_to article.title, article, class: 'category-article-title'
  end
end
