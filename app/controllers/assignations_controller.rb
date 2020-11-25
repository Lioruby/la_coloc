class AssignationsController < ApplicationController
  def show
  end

  def index
  end

  def edit
  end

  def update
    assignation = Assignation.find(params[:id])
    assignation.update!(assignation_params_require)
    raise
    assignation.save!
    redirect_to colocation_path(current_colocation)
  end

  private

  def assignation_params_require
    params.require(:assignation).permit(:photo, :statut)
  end
end
