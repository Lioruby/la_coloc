class UsersController < ApplicationController

  def index
  end

  def destroy_current_colocation_task_index
    @tasks = current_user.colocation.tasks
  end

  def destroy_current_colocation_task
    @colocation = current_user.colocation
    task_to_destroy = @colocation.tasks.select { |task| task.id == params[:task_id].to_i }[0]

    task_to_destroy.destroy
  end

  def show
    @preferences = Preference.all
  end

  def move
    @preferences = current_user.preferences
    task_with_position = {}
    ap params[:all_names]
    names = params[:all_names].split('-')

    names.each_with_index { |name, i| task_with_position[name] = i }
    ap names

    task_with_position.each do |name, position|
      @preferences.each do |pref|
        pref.update(position: position) if name.upcase == pref.task.name.upcase
      end
    end
  end

  def edit
  end

  def update
  end
end
