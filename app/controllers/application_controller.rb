class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :is_actived_user?

  def is_actived_user?
    current_user && current_user.is_actived
  end

  def direct_to_ruby_minerals
    flash[:alert] = "You are run out of rubies, get some rubies from minerals!"
    redirect_to posts_path
  end

  def direct_to_pickax_shop
    flash[:alert] = "Loot some pickax in shop"
    redirect_to posts_path
  end

  def upvote
    @post = Post.find(params[:id])

    if !is_actived_user?
      flash[:alert] = "请验证激活用户，或者登陆"
      redirect_to about_index_path

    elsif current_user.ruby_amount >= 1
      current_user.ruby_amount -= 1
      current_user.save

      v = Vote.new
      v.post = @post
      v.user = current_user
      v.save
      @post.total_rubies += 1
      @post.save

      redirect_to :back

    else
      flash[:alert] = "you need more ruby"
      redirect_to digruby_index_path
    end
  end

  helper_method :current_mcart

  def current_mcart
    @current_mcart ||= find_mcart
  end

  private

  def find_mcart
    mcart = MineralsCart.find_by(id: session[:mcart_id])
    if mcart.blank?
      mcart = MineralsCart.create
    end
    session[:mcart_id] = mcart.id
    return mcart
  end

end
