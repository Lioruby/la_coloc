class CreateDepenses < ActiveRecord::Migration[6.0]
  def change
    create_table :depenses do |t|
      t.string :name
      t.float :montant
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
