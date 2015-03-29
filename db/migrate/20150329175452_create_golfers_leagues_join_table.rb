class CreateGolfersLeaguesJoinTable < ActiveRecord::Migration
  def change
    create_table :golfers_leagues, id: false do |t|
      t.integer :golfer_id
      t.integer :league_id
    end
  end
end
