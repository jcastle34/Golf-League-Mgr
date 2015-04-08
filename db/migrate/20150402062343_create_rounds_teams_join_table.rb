class CreateRoundsTeamsJoinTable < ActiveRecord::Migration
  create_table :rounds_teams, id: false do |t|
    t.integer :round_id
    t.integer :team_id
  end
end
