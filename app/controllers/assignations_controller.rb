class AssignationsController < ApplicationController
  def show
  end

  def index
    @assignations = Assignation.all
  end

  def edit
    @assignation = Assignation.find(params[:assignation_id])
  end

  def update
    assignation = Assignation.find(params[:id])
    assignation.update(photo_params_require)
    assignation[:statut] = true
    assignation.save!
    # assignation.update!(assignation_params_require)
    redirect_to colocation_path(current_colocation)
  end

  private

  def photo_params_require
    params.require(:assignation).permit(:photo)
  end
end
