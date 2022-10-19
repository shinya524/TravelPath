class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @post_spots = PostSpot.limit(4).order(created_at: :desc)
  end
end
