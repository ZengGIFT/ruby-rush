class Admin::PtasksController < ApplicationController
  layout "admin"
  def index
    @ptasks = Ptask.all
  end

  def new
    @ptask = Ptask.new
  end

  def create
    @ptask = Ptask.new(ptask_params)

    if @ptask.save
      redirect_to admin_ptasks_path
    else
      redirect_to :new
    end
  end

  def edit
    @ptask = Ptask.find(params[:id])
  end

  def update
    @ptask = Ptask.find(params[:id])

    if @ptask.update(ptask_params)
      redirect_to admin_ptasks_path
    else
      redirect_to :edit
    end
  end

  def hide
    @ptask = Ptask.find(params[:id])

    @ptask.is_hidden = true
    @ptask.save

    redirect_to admin_ptasks_path
  end

  def publish
    @ptask = Ptask.find(params[:id])

    @ptask.is_hidden = false
    @ptask.save

    redirect_to admin_ptasks_path
  end

  private

  def ptask_params
    params.require(:ptask).permit(:title, :description, :reward)
  end
end
