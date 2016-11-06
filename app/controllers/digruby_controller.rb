class DigrubyController < ApplicationController
  def index
    @minerals = current_mcart.minerals
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

    get_nine_new_minerals
  end

  def dig_again
    if current_user.pickax_amount >= 1
      current_user.pickax_amount -= 1
      current_user.save
      current_mcart.dig_minerals!

      get_nine_new_minerals
      redirect_to digruby_index_path
    else
      direct_to_pickax_shop
    end
  end

  helper_method :current_mcart

  def current_mcart
    @current_mcart ||= find_mcart
  end

  def get_nine_new_minerals
    if current_mcart.minerals.present?
      Mineral.delete_all
    end

    3.times do
      r = rand(1..100)
      m = Mineral.new
      m.minerals_cart = current_mcart
      m.rubies_inside_mineral = rand_result
      m.save
    end

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

  def rand_result
    result = 0
    r = rand(1..100)
    if r > 96
      result = 10
    elsif r > 80
      result = 5
    elsif r > 43
      result = 3
    elsif r > 5
      result = 1
    else
      result = 0
    end

    return result

  end
end
