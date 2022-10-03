class Public::PostSpotsController < ApplicationController
  def new
    @post_spot = PostSpot.new
  end

  def show
    @post_spot = PostSpot.find(params[:id])
  end

  def edit
    @post_spot = PostSpot.find(params[:id])
  end

  def create
    @post_spot = PostSpot.new(post_spot_params)
    @post_spot.user_id = current_user.id
    if @post_spot.save
      redirect_to post_spot_path(@post_spot.id)
    else
      render :new
    end
  end

  def update
    @post_spot = PostSpot.find(params[:id])
    @post_spot.update(post_spot_params)
    redirect_to post_spot_path(@post_spot.id)
  end

  def destroy
    @post_spot = PostSpot.find(params[:id])
    @post_spot.destroy
    redirect_to "/about"
  end

  private
  def post_spot_params
    params.require(:post_spot).permit(:name, :spot_image, :address, :postcode, :genre_id, :introduction, :comment, :latitude, :longitude)
  end
end
