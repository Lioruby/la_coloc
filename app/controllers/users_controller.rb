class UsersController < ApplicationController

  def index
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
