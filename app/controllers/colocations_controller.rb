class ColocationsController < ApplicationController
  before_action :find_colocation, only: [:update, :edit, :show]

  def new
    @colocation = Colocation.new
    check_colocation
  end

  def update
    @colocation.update(name: set_params_coloc)
  end

  def create
    @colocation = Colocation.new(set_params_coloc)
    if @colocation.save
      current_user.colocation = @colocation
      current_user.save
      check_colocation
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def roommates
    @colocation = Colocation.find(params[:colocation_id])
    @work_times = working_time
  end

  private

  def check_colocation
    unless current_user.colocation.nil?
      redirect_to colocation_path(current_user.colocation)
    end
  end

  def set_params_coloc
    params.require(:colocation).permit(:name)
  end

  def find_colocation
    @colocation = Colocation.find(params[:id])
  end

  def working_time
    working_time_for_user = {}
    @colocation.users.each do |user|
      total_duration = 0
      user.tasks.each do |task|
        total_duration += task.duration
      end
      working_time_for_user[user.id] = total_duration
    end
    ap working_time_for_user.sort_by {|k,v| v}.reverse.to_h
    working_time_for_user.sort_by {|k,v| v}.reverse.to_h
  end
end
