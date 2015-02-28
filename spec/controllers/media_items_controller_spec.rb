require 'rails_helper'

describe MediaItemsController, :type => :controller do
  before { sign_in create(:user) }

  it { is_expected.to use_before_action :authenticate_user! }

  describe '#index' do
    before { get :index }
    it { is_expected.to respond_with :ok }
    it { is_expected.to render_template :index }
    
    context 'media items' do
      it { expect(assigns(:media_items)).not_to be_nil }
    end
  end

  describe '#new' do
    before { get :new }
    it { is_expected.to respond_with :ok }
    it { is_expected.to render_template :new }
    
    context 'media item' do
      it { expect(assigns(:media_item)).to be_a_new(MediaItem) }
    end
  end
end
