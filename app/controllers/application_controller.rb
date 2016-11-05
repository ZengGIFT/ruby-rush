class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def is_actived_user?
    current_user && current_user.is_actived
  end
end
