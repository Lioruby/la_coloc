class AddDefaultValueToStatutToAssignations < ActiveRecord::Migration[6.0]
  def change
    change_column :assignations, :statut, :boolean, :default => false
  end
end
