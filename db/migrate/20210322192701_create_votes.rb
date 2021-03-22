class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.references :user, index: true
      t.references :article, index: true

      t.timestamps
    end
    add_foreign_key :votes, :users, column: :user_id
    add_foreign_key :votes, :articles, column: :article_id
  end
end
