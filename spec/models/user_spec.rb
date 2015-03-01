require 'rails_helper'

describe User, :type => :model do
  before { build(:user) }

  it { is_expected.to have_many :media_items }
  it { is_expected.to validate_presence_of :email }

  describe '#able_to_remove' do
    let(:media_item) { build(:media_item) }

    context 'a media_item created by her' do
      before { subject.media_items << media_item }
      it { is_expected.to be_able_to_remove(media_item) }
    end

    context 'a media_item created by someone else' do
      it { is_expected.not_to be_able_to_remove(media_item) }
    end
  end
end
