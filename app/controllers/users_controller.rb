class UsersController < ApplicationController

  def show
    @users=User.find(params[:id])
    @favorites= @users.favorite.order("category_id ASC").page(params[:page]).per(48)
    @convenient=@favorites.where(category_id:'1')
    @sns=@favorites.where(category_id:'2')
    @hobby=@favorites.where(category_id:'3')
    @bussiness=@favorites.where(category_id:'4')
    @shopping=@favorites.where(category_id:'5')
    @other=@favorites.where(category_id:'6')
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
