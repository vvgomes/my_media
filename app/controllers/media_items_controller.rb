class MediaItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @media_items = MediaItem.all
  end

  def new
    @media_item = MediaItem.new
  end
end
