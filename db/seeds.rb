require 'faker'
User.destroy_all
4.times do |index|
  User.create!(name: Faker::Name.unique.name)
end

p '4 users created'

Category.destroy_all
Category.create!([{
    name: 'camping'
  },
  {
    name: 'trekking'
  },
  { 
    name: 'bird watching'
  },
  {
    name: 'biking'
}])

p '4 categories created'

Article.destroy_all

4.times do |index|
  Article.create!([{
    title: Faker::Lorem.sentence(word_count: 3),
    text: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
    image: 'https://images.freeimages.com/images/large-previews/940/ostrich-masai-mara-kenya-1365799.jpg',
    author_id: rand(1..4),
    category_id: 1
    },
    {
      title: Faker::Lorem.sentence(word_count: 3),
      text: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
      image: 'https://images.freeimages.com/images/large-previews/fee/days-end-1392672.jpg',
      author_id: rand(1..4),
      category_id: 2
    },
    { 
      title: Faker::Lorem.sentence(word_count: 3),
      text: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
      image: 'https://images.freeimages.com/images/large-previews/940/ostrich-masai-mara-kenya-1365799.jpg',
      author_id: rand(1..4),
      category_id: 3
    },
    {
    title: Faker::Lorem.sentence(word_count: 3),
    text: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
    image: 'https://images.freeimages.com/images/large-previews/600/bike-path-1438265.jpg',
    author_id: rand(1..4),
    category_id: 4
  }])
end

  
p '16 articles created'

100.times do |index|
  Vote.create!({
    user_id: rand(1..4),
    article_id: rand(1..16)
  })
end

p '100 random votes created'