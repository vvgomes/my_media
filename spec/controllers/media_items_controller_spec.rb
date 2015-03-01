require 'rails_helper'

describe MediaItemsController, :type => :controller do
  let(:user) { create(:user) }
  before { sign_in user }

  it { is_expected.to use_before_action :authenticate_user! }

  describe '#index' do
    before { get :index }
    it { is_expected.to respond_with :ok }
    it { is_expected.to render_template :index }
    
    context 'media items' do
      let!(:media_from_user) { create(:media_item, :user => user) }
      let!(:media_from_someone_else) { create(:media_item) }
      subject { assigns(:media_items) }
      it { is_expected.to include media_from_user }
      it { is_expected.not_to include media_from_someone_else}
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

  describe '#create' do
    context 'with valid params' do
      before { post :create, :media_item => attributes_for(:media_item) }
      it { is_expected.to redirect_to media_items_path }
      it { is_expected.to set_flash }

      context 'media item' do
        subject { assigns(:media_item) }
        it { is_expected.to be_persisted }
        it { expect(subject.user).to eq user }
      end
    end

    context 'with invalid params' do
      before { post :create, :media_item => attributes_for(:media_item).merge(:url => nil) }
      it { is_expected.to respond_with :ok }
      it { is_expected.to render_template :new }
      
      context 'media item' do
        it { expect(assigns(:media_item)).not_to be_persisted }
      end
    end
  end

  describe '#destroy' do
    context 'when the user is the owner' do
      let(:media_item) { create(:media_item, :user => user) }
      before { delete :destroy, :id => media_item.id }
      it { is_expected.to redirect_to media_items_path }
      it { is_expected.to set_flash }
    end

    context 'when the user is not the owner' do
      let(:media_item) { create(:media_item) }
      before { delete :destroy, :id => media_item.id }
      it { is_expected.to respond_with :forbidden }
    end
  end
end
