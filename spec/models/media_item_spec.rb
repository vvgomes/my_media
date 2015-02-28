require 'rails_helper'

describe MediaItem, :type => :model do
  it { is_expected.to validate_presence_of :url }
  it { is_expected.to validate_presence_of :kind }
end
