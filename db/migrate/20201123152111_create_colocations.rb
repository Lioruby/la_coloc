class CreateColocations < ActiveRecord::Migration[6.0]
  def change
    create_table :colocations do |t|
      t.string :name

      t.timestamps
    end
  end
end
