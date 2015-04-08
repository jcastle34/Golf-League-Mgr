class AddLeagueIdColumnToRoundsTable < ActiveRecord::Migration
  def change
    add_column :rounds, :league_id, :integer
  end
end
