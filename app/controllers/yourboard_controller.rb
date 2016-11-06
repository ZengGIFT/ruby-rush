class YourboardController < ApplicationController
  def index
    @created_posts = current_user.posts.order('total_rubies')
    @voted_posts = current_user.voted_posts.order('total_rubies')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to yourboard_index_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :total_rubies)
  end

end
