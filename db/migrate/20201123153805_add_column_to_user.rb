class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_reference :users, :colocation, null: true, foreign_key: true
  end
end
