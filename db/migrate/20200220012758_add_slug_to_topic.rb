class AddSlugToTopic < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :slug, :string
  end
end
