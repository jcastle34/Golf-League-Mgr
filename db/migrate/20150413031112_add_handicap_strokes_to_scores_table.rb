class AddHandicapStrokesToScoresTable < ActiveRecord::Migration
  def change
    add_column :scores, :handicap_strokes, :integer, :default => 0
  end
end
