class Public::CommentsController < ApplicationController
  def create
    @post_cosme = PostCosme.find(params[:post_cosme_id])
    @comment = current_customer.comments.new(comment_params)
    @comment.post_cosme_id = @post_cosme.id
    @comment.save
    #redirect_to post_cosme_path(@post_cosme.id)非同期通信のため
  end

  def destroy
    @post_cosme = PostCosme.find(params[:post_cosme_id])
    @comment = @post_cosme.comments.where(customer: current_customer).find_by(id: params[:id])
    @comment.destroy
    #redirect_to post_cosme_path(params[:post_cosme_id])非同期通信のため
  end

   private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
