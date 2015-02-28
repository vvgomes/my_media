class CreateUsersMediaItems < ActiveRecord::Migration
  def change
    create_table :media_items_users do |t|
      t.integer :user_id
      t.integer :media_item_id
    end
  end
end
