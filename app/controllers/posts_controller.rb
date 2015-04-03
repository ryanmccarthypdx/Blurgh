class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:notice] = "Success!"
      redirect_to posts_path
    else
      flash[:alert] = "Oops! Something went wrong!"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Post Updated!"
      redirect_to posts_path
    else
      flash[:alert] = "Something went wrong!"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end


private

  def post_params
    params.require(:post).permit(:title, :text)
  end

end
