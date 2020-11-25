class CreateAssignations < ActiveRecord::Migration[6.0]
  def change
    create_table :assignations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true
      t.boolean :statut
      t.date :date

      t.timestamps
    end
  end
end
