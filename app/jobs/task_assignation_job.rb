class TaskAssignationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    colocations = Colocation.all

    colocations.each do |colocation|

      colocation.tasks.each do |task|

        if task.recurrence == "quotidien"
          7.times do |i|
            AssignationAlgo.call(colocation, task, Date.today.next_day(i + 1))
          end

        elsif task.recurrence == "hebdomadaire"
          AssignationAlgo.call(colocation, task, Date.today.next_day(4))

        elsif task.recurrence == "mensuel"
          AssignationAlgo.call(colocation, task, Date.today.next_day(10))

        end
      end
    end
  end
end
