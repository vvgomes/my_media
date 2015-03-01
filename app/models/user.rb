class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :media_items

  def able_to_remove?(media_item)
    media_items.include?(media_item)
  end
end
