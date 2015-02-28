class MediaItem < ActiveRecord::Base
  enum :kind => [:video, :image, :website]

  validates :kind, :presence => true
  validates :url, :presence => true,
    :format => { :with => URI::regexp(%w(http https)), :message => 'Invalid URL' }

end
