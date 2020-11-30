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

    if @task.save!
      users = User.all
      users.each do |user|
        if user.colocation == current_colocation
          preference = Preference.new(position: Task.all.count)
          preference.user = user
          preference.task = @task
          preference.save
        end
      end
      redirect_to user_path(current_user)
    else
      redirect_to new_task_path
    end
  end

  def occasionnel
    @assignation = Assignation.new
  end

  def update
  end

  def edit
  end

  def show
  end

  def destroy
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :duration)
  end

end
