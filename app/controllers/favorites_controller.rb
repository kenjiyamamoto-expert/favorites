class FavoritesController < ApplicationController
  def index
    @favorites= Favorite.all
  end

  def new
    @favorite= Favorite.new
  end

  def create
    @favorite= Favorite.new(favorite_params)
    if @favorite.save
      redirect_to root_path,notice: "#{@favorite.name}を登録しました"
    else
      render 'new'
    end
  end

  def edit
    @favorite= Favorite.find(params[:id])
  end

  def update
    @favorite= Favorite.find(params[:id])
    if @favorite.update(favorite_params)
      redirect_to root_path,notice: "#{@favorite.name}を編集しました"
    else
      render 'edit'
    end
  end

  def destroy
    favorite= Favorite.find(params[:id])
    favorite.destroy
    redirect_to root_path,notice: "お気に入りを削除しました"
  end

  private
  def favorite_params
    params.require(:favorite).permit(:name,:url,:image,:text).merge(user_id: current_user.id)
  end
end
