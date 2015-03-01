class MediaItem < ActiveRecord::Base
  enum :kind => [:video, :image, :website]

  belongs_to :user

  validates :kind, :presence => true
  validates :url, :presence => true,
    :format => { :with => URI::regexp(%w(http https)), :message => 'Invalid URL' }

  default_scope { order(:created_at => :desc) }
end
