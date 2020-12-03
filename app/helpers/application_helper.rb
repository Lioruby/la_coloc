module ApplicationHelper
  def change_hebdo_and_quoti(recurrence)
    if recurrence == "hebdomadaire"
      return "semaine"
    else
      return "aujourd'hui"
    end
  end

  def translate_day_name(day)
    case
    when day == "Mon"
      return "Lun"

    when day == "Tue"
      return "Mar"

    when day == "Wed"
      return "Mer"

    when day == "Thu"
      return "Jeu"

    when day == "Fri"
      return "Ven"

    when day == "Sat"
      return "Sam"

    when day == "Sun"
      return "Dim"
    end
  end

  def moins_de_preuve
    assignation_true = []
    Assignation.all.each do |assignation|
      if assignation.statut && assignation.photo.attached == nil
        assignation_true << assignation
      end
    end
      ap assignation_true
  end
end
