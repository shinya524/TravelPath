class Public::UsersController < ApplicationController
   before_action :ensure_guest_user, only: [:edit]

  def show
    @user = User.find(params[:id])
    @post_spots = @user.post_spots
    @prefectures = Prefecture.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def favorites
    @user = User.find(params[:id])
    favorites= Favorite.where(user_id: @user.id).pluck(:post_spot_id)
    @favorite_post_spots = PostSpot.find(favorites)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_image)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end
