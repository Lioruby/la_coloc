class TasksController < ApplicationController

  def index
  end

  def new
    @assignation = Assignation.new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.name = @task.name
    @colocation = current_user.colocation
    @task.colocation = @colocation

    if @task.save
      users = User.all
      users.each do |user|
        if user.colocation == current_colocation
          preference = Preference.new(position: Task.all.count)
          preference.user = user
          preference.task = @task
          preference.save
        end
      end
      assign_task_after_create if current_colocation.users.count > 1
      redirect_to user_path(current_user), notice: 'La tâche a été crée avec succès'
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
      redirect_to colocation_path(current_colocation), notice: 'La modification à été prise en compte'
    else
      redirect_to colocation_path(current_colocation), notice: 'Erreur, veuillez recommencer'
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
    params.require(:task).permit(:name, :description, :duration, :recurrence)
  end

  def assign_task_after_create
    if @task.recurrence == 'quotidien'
      7.times do |i|
        AssignationAlgo.call(current_colocation, @task, Date.today.next_day(i))
      end
    else
      AssignationAlgo.call(current_colocation, @task, Date.today)
    end
  end

end
