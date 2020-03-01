class AddImageToTopics < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :img, :string
  end
end
