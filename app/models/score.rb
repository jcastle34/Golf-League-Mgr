class Score < ActiveRecord::Base
  attr_accessible :golfer_id, :hole_id, :match_id, :strokes

  belongs_to :golfer
  belongs_to :hole
  belongs_to :match

end
