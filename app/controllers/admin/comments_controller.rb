class Admin::CommentsController < ApplicationController

  def destroy
    @post_cosme = PostCosme.find(params[:post_cosme_id])
    @comment = @post_cosme.comments.find_by(id: params[:id])
    @comment.destroy
    render 'public/comments/destroy'
  end
end
