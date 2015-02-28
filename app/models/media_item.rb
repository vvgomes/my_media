class MediaItem < ActiveRecord::Base
  validates :kind, :presence => true
  validates :url, :presence => true,
    :format => { :with => URI::regexp(%w(http https)), :message => 'Invalid URL' }
end
