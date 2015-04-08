class CreateGolfersMatchesJoinTable < ActiveRecord::Migration
  create_table :golfers_matches, id: false do |t|
    t.integer :golfer_id
    t.integer :match_id
  end
end
