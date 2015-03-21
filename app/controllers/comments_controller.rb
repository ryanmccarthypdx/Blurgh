class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @post = Post.find(params[:id])
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @post.comments << @comment
    if @comment.save
      flash[:notice] = "Comment Saved!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Something went wrong!"
      render :new
    end
  end


private
  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end

end
