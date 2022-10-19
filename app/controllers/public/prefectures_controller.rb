class Public::PrefecturesController < ApplicationController
  before_action :search, only: [:show, :search]

  def show
    @prefecture = Prefecture.find(params[:id])
    prefecture_post_spots = PostSpot.where(prefecture_id: @prefecture.id)
    if params[:genre_id]
      prefecture_post_spots = prefecture_post_spots.where(genre_id: params[:genre_id])
    end
    @prefecture_post_spots = prefecture_post_spots.page(params[:page])
    @genres = Genre.all
  end

   def search
    @results = @search.result
  end


  private
  def prefecture_params
    params.require(:prefecture).permit(:name)
  end

  def search
    @search = PostSpot.ransack(params[:q])
  end
end
