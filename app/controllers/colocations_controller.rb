class ColocationsController < ApplicationController
  before_action :find_colocation, only: [:update, :edit, :show]

  skip_before_action :verify_authenticity_token, :only => [:create_invitation]

  before_action :find_colocation_by_colocation_id, only: [:roommates, :create_roomates, :new_roomates, :new_invitation]

  def new
    @colocation = Colocation.new

    check_colocation
  end

  def update
    @colocation.update(name: set_params_coloc)
  end

  def new_invitation
  end

  def new_roomates
  end

  def create_roomates
    current_user.colocation = @colocation
    current_user.save!
    create_preferences_for_current_user
    assign_task_after_create

    redirect_to colocation_path(@colocation)
  end

  def create_invitation
    email_array = params[:Email].split(' ')
    email_array.each do |email|
      send_invitation_email(email)
    end

    redirect_to user_path(current_user)
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
    @work_times = actual_working_time
    @faineant = shame_wall
    @points = count_points
    @least = least_picture
    @radin = pingre

    respond_to do |format|
      format.html

      format.json { render json:
      {
      all_data: {
        users: @colocation.users.map { |u| { name: u.name, id: u.id, work_time: @work_times[u.id] } },

        time_reference: @colocation.users.map { |u| all_time_task_data(u) },

        },
      }
    }
    end
  end

  private

  def all_time_task_data(user)
      data = {}
    data[:user_name] = user.name
    data[:id] = user.id
    tasks = []
    arr = []
    total_duration = 0
    user.assignations.sort_by { |a| a.task.name }.each_with_index do |assignation, i|

      if assignation.statut == true
        ap assignation.task.name


        tasks << [assignation.task.name, number_of_assignation_per_task(user, assignation.task.name)]
        arr << color_array[i]
      end
    end
    data[:tasks] = tasks.to_h
    data[:color] = color_array

    data

  end


  def number_of_assignation_per_task(user, task_name)
    time = 0
    user.assignations.each do |a|
      if a.statut == true && a.task.name == task_name
        time += a.task.duration
      end
    end
    time
  end

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


  def find_colocation_by_colocation_id
    @colocation = Colocation.find(params[:colocation_id])
  end


  def actual_working_time
    working_time_for_user = {}

    @colocation.users.each do |user|
      total_duration = 0
      user.assignations.each do |assignation|
        if assignation.statut == true
          total_duration += assignation.task.duration
        end
      end

      working_time_for_user[user.id] = total_duration
    end
    working_time_for_user.sort_by {|k,v| v}.reverse.to_h
  end


  def shame_wall
    uncompleted_array = {}
    @colocation.users.each do |user|
      uncompleted_tasks = 0
      user.assignations.each do |assignation|
        uncompleted_tasks += 1 if assignation.statut == false
      end
      uncompleted_array[user.id] = uncompleted_tasks
    end
    [uncompleted_array.max_by{|k, v| v}].to_h
  end


  def send_invitation_email(email)
    UserMailer.invitation(user: current_user, email: email, colocation: current_colocation).deliver_now
  end


  def create_preferences_for_current_user
    @colocation.tasks.each_with_index do |task, i|
      ap task
      pref = Preference.new(position: i)
      pref.user = current_user
      pref.task = task
      pref.save!
    end
  end


  def assign_task_after_create

    destroy_colocation_assignations

    @colocation.tasks.each do |task|

      if task.recurrence == "quotidien"
        7.times do |i|
          AssignationAlgo.call(@colocation, task, Date.today.next_day(i + 1))
        end

      elsif task.recurrence == "hebdomadaire"
        AssignationAlgo.call(@colocation, task, Date.today.next_day(4))

      elsif task.recurrence == "mensuel"
        AssignationAlgo.call(@colocation, task, Date.today.next_day(10))

      end
    end
  end

  def destroy_colocation_assignations
    @colocation.users.each do |user|
      user.assignations.each do |assignation|
        assignation.destroy
      end
    end
  end

  def count_points
    points = actual_working_time
    points.each do |key, value|
      points[key] = value * 0.1
      User.find(key).assignations.each do |assignation|
        points[key] += 2.5 if assignation.statut == true
      end
    end
    points.sort_by {|k,v| v}.reverse.to_h
  end

  def least_picture
    hash_picture = {}
    current_colocation.users.each do |user|
      counter = 0
      user.assignations.each do |assignation|
        counter += 1 if assignation.statut == true && !assignation.photo.attached?
      end
      hash_picture[user.id] = counter
    end
    [hash_picture.max_by { |k, v| v }].to_h
  end

  def pingre
    hash_picture = {}
    counter = 0
    current_colocation.users.each do |user|
      counter += user.balance
      hash_picture[user.id] = counter
    end
    [hash_picture.max_by { |k, v| v }].to_h
  end

  def color_array
    ['#FF33FF', '#00B3E6',
      '#E6B333', '#3366E6', '#B34D4D',
      '#E6B3B3', '#6680B3', '#66991A',
      '#FF99E6', '#E6331A',
      '#66994D', '#B366CC', '#4D8000', '#B33300',
      '#991AFF', '#4DB3FF', '#1AB399',
      '#E666B3', '#33991A', '#CC9999', '#B3B31A',
      '#4D8066', '#E6FF80', '#999933',
      '#FF3380', '#CCCC00', '#4D80CC', '#9900B3',
      '#E64D66', '#4DB380', '#FF4D4D', '#6666FF']
  end

end
