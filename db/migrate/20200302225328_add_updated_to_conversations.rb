class AddUpdatedToConversations < ActiveRecord::Migration[6.0]
  def change
    add_column :conversations, :updated, :boolean
  end
end
