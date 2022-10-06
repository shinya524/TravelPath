class Public::HomesController < ApplicationController
  def top
    @post_spots = PostSpot.limit(4).order(created: :desc)
    @prefectures = Prefecture.all
  end

  def about
  end

  private
  def post_spot_params
    params.require(:post_spot).permit(:name, :comment)
  end
end
