class Handicap < ActiveRecord::Base
  attr_accessible :date, :golfer_id, :league_id, :score
end
