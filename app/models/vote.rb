class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article

  def self.count_by_article
    self.group(:article_id).order('count_all desc').count
  end

  def self.count_by_category
    joins('INNER JOIN articles ON articles.id = votes.article_id')
      .joins('INNER JOIN categories ON categories.id=articles.category_id')
      .group(:category_id).order('count_all desc').count
  end
end
