class Category < ApplicationRecord
  has_many :articles

  def self.prioritize(votes_by_category)
    categories = votes_by_category.keys
    categories.each_with_index do |category, i|
      find(category).update(priority: i + 1)
    end
    return self.all
  end
end
