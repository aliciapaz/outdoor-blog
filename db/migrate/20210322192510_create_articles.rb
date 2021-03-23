class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.string :image
      t.references :author, index: true
      t.references :category, index: true

      t.timestamps
    end
    add_foreign_key :articles, :users, column: :author_id
    add_foreign_key :articles, :categories, column: :category_id
  end
end
