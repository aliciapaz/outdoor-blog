class User < ApplicationRecord
  has_many :articles
  has_many :votes, dependent: :destroy
  has_many :voted_articles, through: :votes, source: :article

  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 30,
                                                               too_long: '%{count} characters is the maximum allowed' }

  before_validation :normalize_name, on: :create

  private

  def normalize_name
    self.name = name.downcase
  end

end
