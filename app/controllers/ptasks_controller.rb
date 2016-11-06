class PtasksController < ApplicationController
  def index
    @ptasks = Ptask.all
  end
end
