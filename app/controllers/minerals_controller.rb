class MineralsController < ApplicationController
  def select_mineral
    current_mcart.select_mineral!
    @mineral = Mineral.find(params[:id])
    @mineral.is_selected = true
    @mineral.save


    current_mcart.rubies_incart = @mineral.rubies_inside_mineral
    current_mcart.save

    income = current_mcart.rubies_incart
    current_user.ruby_amount += income
    current_user.save

    sleep 1.2
    redirect_to digruby_index_path
  end
end
