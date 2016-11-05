class PostsController < ApplicationController
  def index
    @posts = Post.all
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

  def upvote
    @post = Post.find(params[:id])

    if !is_actived_user?
      flash[:alert] = "请找老萨满验证激活用户，或者登陆"
      redirect_to digruby_index_path

    elsif current_user.ruby_amount >= 10
      current_user.ruby_amount -= 10
      current_user.save

      @post.votes.create
      @post.total_rubies += 1
      @post.save

      redirect_to posts_path

    else
      flash[:alert] = "you need more ruby"
      redirect_to digruby_index_path
    end

  end


  private

  def post_params
    params.require(:post).permit(:title, :description)
  end
end
