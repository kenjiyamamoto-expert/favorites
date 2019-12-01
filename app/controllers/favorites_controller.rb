class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @recommended= Favorite.order("created_at DESC").page(params[:page]).per(20)
  end

  def new
    @favorite= Favorite.new
  end

  def create
    @favorite= Favorite.new(favorite_params)
    if @favorite.save
      redirect_to user_path(current_user),notice: "#{@favorite.name}を登録しました"
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
      redirect_to user_path(current_user),notice: "#{@favorite.name}を編集しました"
    else
      render 'edit'
    end
  end

  def destroy
    favorite= Favorite.find(params[:id])
    if favorite.user_id == current_user.id
      favorite.destroy
      redirect_to user_path(current_user),notice: "お気に入りを削除しました"
    end
  end

  def search
    @users = current_user.id
    @favorites = Favorite.search(params[:search])
    sort = params[:sort] || "created_at DESC"
    @current_user_favorites=@favorites.where(user_id:@users).page(params[:page]).order(sort)
  end

  private
  def favorite_params
    params.require(:favorite).permit(:name,:url,:image,:text).merge(user_id: current_user.id)
  end
end
