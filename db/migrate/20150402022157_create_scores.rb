class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :hole
      t.integer :strokes
      t.integer :match_id
      t.integer :golfer_id

      t.timestamps
    end
  end
end
