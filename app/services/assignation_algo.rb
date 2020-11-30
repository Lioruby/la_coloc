class AssignationAlgo
  def initialize(colocation, task, date)
    @colocation = colocation
    @task = task
    @date = date
  end

  def self.call(*args)
    new(*args).call
  end

  def call
    hash_working_time = working_time
    ap hash_working_time
    task_for = faineants(hash_working_time)
    ap task_for
    user1 = User.find(task_for.keys.first)
    user2 = User.find(task_for.keys.second)
    if task_for.values.second - task_for.values.first < 20
      pref_user_1 = preference(user1, @task)
      ap pref_user_1
      pref_user_2 = preference(user2, @task)
      ap pref_user_2
      if pref_user_2 < pref_user_1
        assign(user2, @task)
      else
        assign(user1, @task)
      end
    else
      assign(user1, @task)
    end
  end

  private

  def working_time
    working_time_for_user = {}
    @colocation.users.each do |user|
      ap "Je calcule le temps pour #{user.id}"
      total_duration = 0
      user.reload.tasks.each do |task|
        ap task
        total_duration += task.duration
      end
      working_time_for_user[user.id] = total_duration
    end
    working_time_for_user
  end

  def faineants(hash_working)
    first_min = [hash_working.min_by { |a, b| b }].to_h
    hash_working.delete(first_min.keys.first)
    second_min = [hash_working.min_by { |a, b| b }].to_h

    hash_mins = first_min.merge(second_min)
  end

  def preference(user, tache)
    # renvoie la position de la tache dans les preferences du user
    position = nil
    user.preferences.each do |preference|
      position = preference.position if preference.task_id == tache.id
    end
    position
  end

  def assign(user, tache)
    Assignation.create!(user_id: user.id, task_id: tache.id, date: @date)
  end
end
