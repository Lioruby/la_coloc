class ColocationsController < ApplicationController
  before_action :find_colocation, only: [:update, :edit, :show]

  def new
    @colocation = Colocation.new
  end

  def update
    @colocation.update(name: set_params_coloc)
  end

  def create
    @colocation = Colocation.new(set_params_coloc)
    if @colocation.save
      current_user.colocation = @colocation
      current_user.save
      check_colocation
      redirect_to colocation_path(@colocation)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def roommates
    @colocation = Colocation.find(params[:colocation_id])
  end

  private

  def check_colocation
    if current_user.colocation.nil?
      redirect_to new_colocation_path
    end
  end

  def set_params_coloc
    params.require(:colocation).permit(:name)
  end

  def find_colocation
    @colocation = Colocation.find(params[:id])
  end
end
