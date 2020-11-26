class AssignationAlgo
  def initialize(colocation, task)
    @colocation = colocation
    @task = task
  end

  def self.call(*args)
    new(*args).call
  end

  def call
    hash_working_time = working_time
    task_for = faineant(hash_working_time)
    assignation = Assignation.new(task_id: @task.id, user_id: task_for.keys.first.values[0].id)
  end

  private

  def working_time
    working_time_for_user = {}
    @colocation.users.each do |user|
      total_duration = 0
      user.tasks.each do |task|
        total_duration += task.duration
      end
      working_time_for_user[user: user] = total_duration
    end
    working_time_for_user
  end

  def faineant(hash_working)
    ap [hash_working.min_by{|k, v| v}].to_h
    [hash_working.min_by{|k, v| v}].to_h
  end
end
