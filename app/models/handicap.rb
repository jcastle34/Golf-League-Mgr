class Handicap < ActiveRecord::Base
  attr_accessible :date, :golfer_id, :league_id, :score

  belongs_to :golfer

end
