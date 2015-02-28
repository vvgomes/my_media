require 'rails_helper'

describe MediaItem, :type => :model do
  subject { build(:media_item) }

  it { is_expected.to validate_presence_of :kind }
  it { is_expected.to validate_presence_of :url }
  it { is_expected.to allow_value('http://google.com').for(:url) }
  it { is_expected.not_to allow_value('not-an-url').for(:url) }
end
