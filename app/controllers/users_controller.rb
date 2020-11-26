class UsersController < ApplicationController
  def new
  end

  def index
  end

  def show
    @preferences = Preference.all
  end

  def create
  end

  def move
    @preferences = current_user.preferences
    task_with_position = {}
    names = params[:all_names].split(' ')
    ap names

    names.each_with_index { |name, i| task_with_position[name] = i }

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
