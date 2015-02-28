require 'rails_helper'

describe MediaItemsController, :type => :controller do
  it { is_expected.to use_before_action :authenticate_user! }
end
