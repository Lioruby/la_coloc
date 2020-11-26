class AddColumnNameToAssignation < ActiveRecord::Migration[6.0]
  def change
    add_column :assignations, :name, :string
  end
end
