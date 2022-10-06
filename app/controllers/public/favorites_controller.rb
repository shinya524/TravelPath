class Public::FavoritesController < ApplicationController

  def create
    @post_spot = PostSpot.find(params[:post_spot_id])
    @post_spot_favorite = Favorite.new(user_id: current_user.id, post_spot_id: params[:post_spot_id])
    @post_spot_favorite.save
  end

  def destroy
    @post_spot = PostSpot.find(params[:post_spot_id])
    @post_spot_favorite = Favorite.find_by(user_id: current_user.id, post_spot_id: params[:post_spot_id])
    @post_spot_favorite.destroy
  end
end
