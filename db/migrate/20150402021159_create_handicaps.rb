class CreateHandicaps < ActiveRecord::Migration
  def change
    create_table :handicaps do |t|
      t.integer :score
      t.date :date
      t.integer :golfer_id
      t.integer :league_id

      t.timestamps
    end
  end
end
