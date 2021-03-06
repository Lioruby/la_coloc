class AssignationsController < ApplicationController
  def show
    @assignation = Assignation.find(params[:id])
  end

  def index
    @assignations = Assignation.all
  end

  def edit
    @assignation = Assignation.find(params[:assignation_id])
  end

  def create
    @assignation = Assignation.new(assignation_params)

    if @assignation.save
      redirect_to colocation_path(current_colocation), notice: 'Assignation crée avec succès'
    else
      redirect_to occasionnel_tasks_path, notice: 'Erreur, veuillez recommencer'
    end
  end

  def update
    assignation = Assignation.find(params[:id])
    if params[:assignation].present?
      assignation.update(photo_params_require)
    end
    assignation[:statut] = true
    if assignation.save
    # assignation.update!(assignation_params_require)
      redirect_to assignations_path, notice: 'la tâche a bien été validée avec une photo'
    else
      redirect_to assignations_path, notice: 'la tâche a bien été validée sans photo'
    end
  end

  def update_before_photo
    @assignation = Assignation.find(params[:id])
    @assignation.update(assignation_params)

    if @assignation.save
      redirect_to colocation_path(current_colocation), notice: 'La tâche à bien été modifiée'
    else
      redirect_to colocation_path(current_colocation), notice: 'Erreur, veuillez recommencer'
    end
  end

  private

  def photo_params_require
    params.require(:assignation).permit(:photo)
  end

  def assignation_params
    params.require(:assignation).permit(:date, :name, :user_id)
  end
end
