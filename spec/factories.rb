require 'faker'

FactoryBot.define do
  factory :user, class: 'User' do
    name { Faker::Name.unique.name }
  end

  factory :category, class: 'Category' do
    name { Faker::Lorem.characters(number: 7)}
  end

  factory :article, class: 'Article' do
    title { Faker::Lorem.sentence(word_count: 2) }
    text { Faker::Lorem.paragraph_by_chars(number: 15, supplemental: false) }
    image { 'https://images.freeimages.com/images/large-previews/8c5/grey-squirrel-1401263.jpg' }
    author_id { rand(1..4) }
    category_id { rand(1..4) }
  end

  factory :vote, class: 'Vote' do
    user_id { rand(1..4) }
    article_id { rand(1..16) }
  end
end
