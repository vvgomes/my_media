class MediaItem < ActiveRecord::Base
  validates :url, :presence => true
  validates :kind, :presence => true
end
