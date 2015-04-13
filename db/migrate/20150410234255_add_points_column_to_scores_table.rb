class AddPointsColumnToScoresTable < ActiveRecord::Migration
  def change
    add_column :scores, :points, :float, :default => 0
  end
end
