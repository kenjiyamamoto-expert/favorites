class FavoritesController < ApplicationController
  def index
    @favorites= Favorite.all
  end

  def new
    @favorite= Favorite.new
  end

  def create
    favorite= Favorite.new(favorite_params)
    favorite.save!
    redirect_to "/completion_registration"
  end

  def edit
    @favorite= Favorite.find(params[:id])
  end

  def update
    favorite= Favorite.find(params[:id])
    favorite.update!(favorite_params)
    redirect_to "/completion_edit"
  end
  
  def completion_edit
  end

  def completion_registration
  end

  def completion_delete
  end

  private
  def favorite_params
    params.require(:favorite).permit(:name,:url,:image,:text)
  end
end
