module ApplicationHelper
  def change_hebdo_and_quoti(recurrence)
    if recurrence == "hebdomadaire"
      return "semaine"
    else
      return "aujourd'hui"
    end
  end
end
