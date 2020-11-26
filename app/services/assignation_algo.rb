class AssignationAlgo
  def initialize(colocation, task)
    @colocation = colocation
    @task = task
  end

  def assign_task
  end

  private

  def working_time
    @colocation.user
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
