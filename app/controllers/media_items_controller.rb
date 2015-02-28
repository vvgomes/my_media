class MediaItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @media_items = MediaItem.all
  end

  def new
    @media_item = MediaItem.new
  end

  def create
    @media_item = MediaItem.new(media_item_params)
    @media_item.users << current_user
    if @media_item.save
      redirect_to media_items_path, notice: 'Media item was successfully created.'
    else
      render :new
    end
  end

  private

  def media_item_params
    params.require(:media_item).permit(:url, :kind, :description)
  end
end
