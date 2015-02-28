class CreateMediaItems < ActiveRecord::Migration
  def change
    create_table :media_items do |t|
      t.string :url
      t.string :description
      t.integer :kind

      t.timestamps null: false
    end
  end
end
