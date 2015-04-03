class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
    respond_to do |format|
      format.html
      format.js
    end
  end


  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
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

  def edit
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    render '_edit_form'
  end

  def update
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    if @comment.update(comment_params)
      flash[:notice] = "Comment Updated!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Something went wrong!"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:notice] = "See you in hell, comment!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Something went wrong!"
      redirect_to post_path(@post)
    end
  end

private
  def comment_params
    params.require(:comment).permit(:text, :post_id, :id)
  end

end
