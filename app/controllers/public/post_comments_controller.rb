class Public::PostCommentsController < ApplicationController

  def create
    @post_comment = current_user.post_comments.new(post_comment_params)
    @post_comment.save
    redirect_to post_spot_path(@post_comment.post_spot.id)
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment, :post_spot_id)
  end
end
