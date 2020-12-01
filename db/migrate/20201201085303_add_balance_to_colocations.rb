class AddBalanceToColocations < ActiveRecord::Migration[6.0]
  def change
    add_column :colocations, :balance, :float, default: 0
  end
end
