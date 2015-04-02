class Score < ActiveRecord::Base
  attr_accessible :golfer_id, :hole, :match_id, :strokes
end
