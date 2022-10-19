class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  before_action :search

  def search
    @search = PostSpot.ransack(params[:q])
    @results = @search.result
  end
end
