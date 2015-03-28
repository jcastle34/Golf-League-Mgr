class CreateLeagueTeams < ActiveRecord::Migration
  def change
    create_table :league_teams do |t|
      t.string :name
      t.integer :league_id

      t.timestamps
    end
  end
end
