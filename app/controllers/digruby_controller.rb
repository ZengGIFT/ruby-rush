class DigrubyController < ApplicationController
  def index

  end

  def start_digging
    if current_user.pickax_amount >= 1
      current_user.pickax_amount -= 1
      current_user.save
      current_mcart.dig_minerals!

      redirect_to digruby_index_path
    else
      direct_to_pickax_shop
    end
  end

  def select_mineral
    current_mcart.select_mineral!

    redirect_to digruby_index_path
  end

  def dig_again
    if current_user.pickax_amount >= 1
      current_user.pickax_amount -= 1
      current_user.save
      current_mcart.dig_minerals!

      redirect_to digruby_index_path
    else
      direct_to_pickax_shop
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

  def get_nine_minerals
    
  end
end
