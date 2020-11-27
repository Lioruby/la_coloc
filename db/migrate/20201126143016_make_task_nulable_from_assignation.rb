class MakeTaskNulableFromAssignation < ActiveRecord::Migration[6.0]
  def change
    change_column :assignations, :task_id, :bigint, null: true
  end
end
