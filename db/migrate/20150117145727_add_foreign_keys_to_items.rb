class AddForeignKeysToItems < ActiveRecord::Migration
  def change
    add_column :items, :user_id, :integer
    add_column :items, :list_id, :integer
  end
end
