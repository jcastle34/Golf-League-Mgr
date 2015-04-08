class Score < ActiveRecord::Base
  attr_accessible :golfer_id, :hole, :match_id, :strokes

  belongs_to :golfer
  belongs_to :hole

end
