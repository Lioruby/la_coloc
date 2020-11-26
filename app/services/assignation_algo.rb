class AssignationAlgo
  def initialize(tasks, users)
    @task = tasks
    @users = users
  end

  def assign_task_to
    @tasks.each do |task|
      if task.recurrence == 'quotidienne'
        i = 1
        7.times do
          date = Date.next_day(i)
          assign = Assignation.new(date: date)
          assign.user = @users.sample
          assign.task = task
          i += 1
        end
      else
        date = Date.next_day(i)
        assign = Assignation.new(date: date)
        assign.user = User.all.sample
        assign.task = task
      end
    end
  end
end

