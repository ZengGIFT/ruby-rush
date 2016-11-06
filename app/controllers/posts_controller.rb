class PostsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create]

  def index
    @posts = Post.all.order('updated_at DESC')
    # order on updated_at
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end



  private

  def post_params
    params.require(:post).permit(:title, :description)
  end
end
