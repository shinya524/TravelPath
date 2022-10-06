class Public::PrefecturesController < ApplicationController
  def show
    @prefecture = Prefecture.find(params[:id])
    @prefecture_post_spots = PostSpot.where(prefecture_id: @prefecture.id).page(params[(:page)])
    @genres = Genre.all
  end


  private
  def prefecture_params
    params.require(:prefecture).permit(:name)
  end
end
