class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @recommended= Favorite.order("created_at DESC").where('user_id IS NULL')
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
    @current_user_favorites=@favorites.where(user_id:@users).page(params[:page]).per(48).order(sort)
  end

  def convinient
    @users=User.find(current_user.id)
    @convinients= @users.favorite.where(category_id:'1').order("links_count desc").page(params[:page]).per(48)
  
  end

  def sns
    @users=User.find(current_user.id)
    @snses= @users.favorite.where(category_id:'2').order("links_count desc").page(params[:page]).per(48)
  end

  def hobby
    @users=User.find(current_user.id)
    @hobbys= @users.favorite.where(category_id:'3').order("links_count desc").page(params[:page]).per(48)
  end

  def bussiness
    @users=User.find(current_user.id)
    @bussinesses= @users.favorite.where(category_id:'4').order("links_count desc").page(params[:page]).per(48)
  end

  def shopping
    @users=User.find(current_user.id)
    @shoppings= @users.favorite.where(category_id:'5').order("links_count desc").page(params[:page]).per(48)
  end
  
  def other
    @users=User.find(current_user.id)
    @others= @users.favorite.where(category_id:'6').order("links_count desc").page(params[:page]).per(48)
  end

  private
  def favorite_params
    params.require(:favorite).permit(:name,:url,:category_id,:image,:text).merge(user_id: current_user.id)
  end
end
