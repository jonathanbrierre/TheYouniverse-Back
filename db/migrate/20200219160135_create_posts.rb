class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :topic, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
