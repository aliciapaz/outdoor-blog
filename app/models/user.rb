class User < ApplicationRecord
  has_many :articles
  has_many :votes, dependent: :destroy
  has_many :voted_articles, through: :votes, source: :article
end
