class AssignationsController < ApplicationController
  def show
  end

  def index
    @assignations = Assignation.all
  end

  def edit
  end

  def create
    @assignation = Assignation.new(assignation_params)

    if @assignation.save!
      redirect_to root_path
    else
      redirect_to new_task_path
    end
  end

  def update
    assignation = Assignation.find(params[:id])
    assignation[:statut] = true
    # assignation.update!(assignation_params_require)
    assignation.save!
    redirect_to colocation_path(current_colocation)
  end

  def assignation_params
    params.require(:assignation).permit(:date, :name, :user_id)
  end
end
