class UsersController < ApplicationController

  def show
    @users=User.find(params[:id])
    @favorites= Favorite.order("created_at DESC").page(params[:page]).per(20)
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path,notice:'アカウントが編集されました'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
