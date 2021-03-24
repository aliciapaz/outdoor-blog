class Article < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :category
  has_many :votes, dependent: :destroy
  has_many :voters, through: :votes, source: :user

  validates :title, presence: true, length: { minimum: 2, maximum: 100,
                                              too_long: '%{count} characters is the maximum allowed' }
  validates :title, presence: true, length: { minimum: 2, maximum: 3000,
                                              too_long: '%{count} characters is the maximum allowed' }
  validates :author_id, presence: true
  validates :category_id, presence: true

  scope :camping, -> { where('category_id = ?', '1') }
  scope :trekking, -> { where('category_id = ?', '2') }
  scope :bird_watching, -> { where('category_id = ?', '3') }
  scope :biking, -> { where('category_id = ?', '4') }

  def self.most_popular(votes_by_article)
    find(votes_by_article.keys[0])
  end
end
