class Match < ActiveRecord::Base
  attr_accessible :date, :league_id, :name

  belongs_to :league
  has_and_belongs_to_many :golfers
  belongs_to :round


  def self.create_score_card_for_match(match)
    i = 1
    9.times do
      Score.create(:hole => i, :match_id => match.id, :golfer_id => match.golfers[0].id)
      i += 1
    end

    i = 1
    9.times do
      Score.create(:hole => i, :match_id => match.id, :golfer_id => match.golfers[1].id)
      i += 1
    end
  end
end
