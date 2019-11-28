class LinksController < ApplicationController
  before_action :set_favorite

  def create
    @link = Link.create(user_id: current_user.id, favorite_id: params[:favorite_id])
    @links = Link.where(favorite_id: params[:favorite_id])
    @favorite.reload
  end

  def destroy
    link = Link.find_by(user_id: current_user.id, favorite_id: params[:favorite_id])
    link.destroy
    @links = Link.where(favorite_id: params[:favorite_id])
    @favorite.reload
  end

  private

  def set_favorite
    @favorite = Favorite.find(params[:favorite_id])
  end
end
