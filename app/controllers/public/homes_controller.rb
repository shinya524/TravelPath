class Public::HomesController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about]

  def top
    @post_spots = PostSpot.limit(4).order(created_at: :desc)
    @prefectures = Prefecture.all
  end

  def about
  end

  private
  def post_spot_params
    params.require(:post_spot).permit(:name, :comment)
  end
end
