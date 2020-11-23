class CreatePreferences < ActiveRecord::Migration[6.0]
  def change
    create_table :preferences do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :rating
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
