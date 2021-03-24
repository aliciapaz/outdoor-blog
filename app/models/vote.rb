class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article

  def self.vote_count
    self.group(:article_id).order('count_all desc').count
  end
end
