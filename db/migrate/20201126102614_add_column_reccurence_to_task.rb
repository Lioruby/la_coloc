class AddColumnReccurenceToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :recurrence, :string
  end
end
