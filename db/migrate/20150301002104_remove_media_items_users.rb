class RemoveMediaItemsUsers < ActiveRecord::Migration
  def change
    drop_table :media_items_users
  end
end
