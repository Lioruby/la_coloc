namespace :colocation do
  desc "Assign Tasks to all colocation's users"
  task assign_all: :environment do
    TaskAssignationJob.perform_later if Date.today.sunday?
  end
end
