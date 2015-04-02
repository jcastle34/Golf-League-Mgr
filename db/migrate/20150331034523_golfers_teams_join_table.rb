class GolfersTeamsJoinTable < ActiveRecord::Migration
  create_table :golfers_teams, id: false do |t|
    t.integer :golfer_id
    t.integer :team_id
  end
end
