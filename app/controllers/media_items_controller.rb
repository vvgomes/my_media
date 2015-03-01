class MediaItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @media_items = MediaItem.all
  end

  def new
    @media_item = MediaItem.new
  end

  def create
    @media_item = MediaItem.new(media_item_params.merge(:user => current_user))
    if @media_item.save
      redirect_to media_items_path, notice: 'Media item was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @media_item = MediaItem.find(params[:id])
    return forbid! unless current_user.able_to_remove?(@media_item)    
    @media_item.destroy
    redirect_to media_items_path, notice: 'Media item was successfully destroyed.'
  end

  private

  def media_item_params
    params.require(:media_item).permit(:url, :kind, :description)
  end

  def forbid!
    render :status => :forbidden, 
      :text => 'You do not have rights to perform this operation.'
  end
end
