class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :colocation, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.integer :duration

      t.timestamps
    end
  end
end
