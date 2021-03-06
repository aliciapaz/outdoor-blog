class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :user_id, presence: true
  validates :article_id, presence: true
  validate :vote_is_unique, on: :create

  def vote_is_unique
    v = Vote.where(article_id: self[:article_id], user_id: self[:user_id])
    errors.add(:vote_is_unique, 'a user can vote an article only once!') unless v.empty?
  end

  def self.count_by_article
    group(:article_id).order('count_all desc').count
  end

  def self.count_by_category
    joins('INNER JOIN articles ON articles.id = votes.article_id')
      .joins('INNER JOIN categories ON categories.id=articles.category_id')
      .group(:category_id).order('count_all desc').count
  end
end
