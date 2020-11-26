class RenamePreferenceRatingColumnToPosition < ActiveRecord::Migration[6.0]
  def change
    rename_column :preferences, :rating, :position
  end
end
