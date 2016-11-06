class MineralsController < ApplicationController
  def select_mineral
    current_mcart.select_mineral!
    @mineral = Mineral.find(params[:id])
  
    current_mcart.rubies_incart = @mineral.rubies_inside_mineral
    current_mcart.save

    income = current_mcart.rubies_incart
    current_user.ruby_amount += income
    current_user.save

    redirect_to digruby_index_path
  end
end
