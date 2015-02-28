class MediaItem < ActiveRecord::Base
  enum :kind => [:video, :image, :website]

  has_and_belongs_to_many :users

  validates :kind, :presence => true
  validates :url, :presence => true,
    :format => { :with => URI::regexp(%w(http https)), :message => 'Invalid URL' }

end
