class RenameColumnForScoresTable < ActiveRecord::Migration
  def change
    rename_column :scores, :hole, :hole_id
  end
end
