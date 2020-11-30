class TasksController < ApplicationController
  def index
  end

  def new
    @assignation = Assignation.new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @colocation = current_user.colocation
    @task.colocation = @colocation

    if @task.save
      users = User.all
      users.each do |user|
      preference = Preference.new(position: User.all.count)
      preference.user = user
      preference.task = @task
      preference.save
      end
      redirect_to root_path, notice: 'La tâche a été crée avec succès'
    else
      redirect_to new_task_path, notice: 'Erreur, veuillez recommencer'
    end
  end

  def occasionnel
    @assignation = Assignation.new
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)


    if @task.save
      redirect_to new_task_path, notice: 'La modification à été prise en compte'
    else
      redirect_to new_task_path, notice: 'Erreur, veuillez recommencer'
    end
  end

  def edit
  end

  def show
    @task = Task.find(params[:id])
  end

  def destroy
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :duration)
  end

end
