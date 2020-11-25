class AssignationsController < ApplicationController
  def show
  end

  def index
    @assignations = Assignation.all
  end

  def edit
  end

  def update
    assignation = Assignation.find(params[:id])
    assignation[:statut] = true
    # assignation.update!(assignation_params_require)
    assignation.save!
    redirect_to colocation_path(current_colocation)
  end

  private

  # def assignation_params_require
  #   params.require(:assignation).permit(:photo)
  # end
end
