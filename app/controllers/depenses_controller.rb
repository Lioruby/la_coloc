class DepensesController < ApplicationController

  def index
  end

  def new
    @depense = Depense.new
  end

  def create
    @depense = Depense.new(depense_params)
    current_colocation.balance += @depense.montant
    current_colocation.save!
    @depense.user.balance += @depense.montant
    @depense.user.save!

    if @depense.save
      redirect_to user_path(current_user), notice: 'La tâche a été crée avec succès'
    else
      redirect_to new_colocation_depense_path, notice: 'Erreur, veuillez recommencer'
    end
  end

  def show
    @depense = Depense.find(params[:id])
  end

  def update
  end

  def edit
    @depense = Depense.find(params[:id])
    @depense.update(montant: depense_params[:montant], name: depense_params[:name])
    @depense.user = depense_params[:user]

    if @depense.save
      redirect_to colocation_path, notice: 'La modification à été prise en compte'
    else
      redirect_to new_colocation_depense_path, notice: 'Erreur, veuillez recommencer'
    end
  end

  def recap
  end

  private

  def depense_params
    params.require(:depense).permit(:montant, :name, :user_id)
  end
end
