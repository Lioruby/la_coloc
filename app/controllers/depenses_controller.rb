class DepensesController < ApplicationController

  def index
    @hash_balance = recap
  end

  def new
    @depense = Depense.new
  end

  def create
    @depense = Depense.new(depense_params)
    if @depense.save
      @depense.user.balance += @depense.montant
      user = @depense.user
      user.save!
      current_colocation.balance += @depense.montant
      current_colocation.save!
      redirect_to depenses_path, notice: 'La tâche a été crée avec succès'
    else
      redirect_to new_depense_path, notice: 'Erreur, veuillez recommencer'
    end
  end

  def show
    @depense = Depense.find(params[:id])
  end

  def update
  end

  def edit
    # @depense = Depense.find(params[:id])
    # @depense.update(montant: depense_params[:montant], name: depense_params[:name])
    # @depense.user = depense_params[:user]

    # if @depense.save
    #   redirect_to colocation_path, notice: 'La modification à été prise en compte'
    # else
    #   redirect_to new_colocation_depense_path, notice: 'Erreur, veuillez recommencer'
    # end
  end

  private

  def recap
    average = current_colocation.balance / current_colocation.users.count

    balance_hash = {}

    current_colocation.users.each do |user|
      balance_hash["#{user.name}"] = user.balance - average
    end

    balance_hash
  end


  def depense_params
    params.require(:depense).permit(:montant, :name, :user_id)
  end

  # def user_id
  #       params.require(:depense).permit(:user)[:user].to_i

  # end
end
