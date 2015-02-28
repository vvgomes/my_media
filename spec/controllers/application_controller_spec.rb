require 'rails_helper'

describe ApplicationController, :type => :controller do

  describe '#index' do
    before { sign_in create(:user) }
    before { get :index }
    it { is_expected.to respond_with :ok }
    it { is_expected.to render_template :index }
  end

end
