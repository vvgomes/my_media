require 'rails_helper'

describe MediaItem, :type => :model do
  subject { build(:media_item) }

  it { is_expected.to belong_to :user }
  it { is_expected.to validate_presence_of :user }

  it { is_expected.to validate_presence_of :url }
  it { is_expected.to allow_value('http://google.com').for(:url) }
  it { is_expected.not_to allow_value('not-an-url').for(:url) }

  it { is_expected.to validate_presence_of :kind }
  it { is_expected.to allow_value('video').for(:kind) }
  it { is_expected.to allow_value('image').for(:kind) }
  it { is_expected.to allow_value('website').for(:kind) }

  it 'does not allow invalid value for kind' do
    expect { subject.kind = 'invalid' }.to raise_error
  end

  it 'sort by most recent by default' do
    expect(MediaItem.all.to_sql).to eq MediaItem.all.order(:created_at => :desc).to_sql
  end
end
