class Public::PostCommentsController < ApplicationController

  def create
    @post_spot = PostSpot.find(params[:post_spot_id])
    @post_comments = @post_spot.post_comments
    @post_comment = current_user.post_comments.new(post_comment_params)
    @post_comment.save
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment, :post_spot_id)
  end
end
