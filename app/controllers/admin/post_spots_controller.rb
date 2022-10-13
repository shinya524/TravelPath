class Admin::PostSpotsController < ApplicationController
  def show
    @post_spot = PostSpot.find(params[:id])
    @post_comments = @post_spot.post_comments
  end

  def edit
     @post_spot = PostSpot.find(params[:id])
  end

   def update
    @post_spot = PostSpot.find(params[:id])
    @post_spot.update(post_spot_params)
    redirect_to admin_post_spot_path(@post_spot.id)
  end

  def destroy
    @post_spot = PostSpot.find(params[:id])
    @post_spot.destroy
    redirect_to admin_user_path(@post_spot.user.id)
  end

  private
  def post_spot_params
    params.require(:post_spot).permit(:name, :spot_image, :address, :postcode, :genre_id, :prefecture_id, :introduction, :comment, :latitude, :longitude)
  end
end
