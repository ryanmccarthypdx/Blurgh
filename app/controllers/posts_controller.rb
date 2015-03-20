class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Success!"
      redirect_to root_path
    else
      flash[:alert] = "Oops! Something went wrong!"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

private

  def post_params
      params.require(:post).permit(:title, :text)
    end

end
