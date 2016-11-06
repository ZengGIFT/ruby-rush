class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

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
end
