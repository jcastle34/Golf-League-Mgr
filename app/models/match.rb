class Match < ActiveRecord::Base
  attr_accessible :date, :league_id, :name, :round_id, :is_front_side, :round

  belongs_to :league
  has_and_belongs_to_many :golfers
  belongs_to :round


  def create_score_card
    if is_front_side?
      create_front_side_scores()
    else
      create_back_side_scores()
    end
    calculate_handicap_strokes
  end

  def create_front_side_scores
    golfers.each do |golfer|
      i = 1
      9.times do
        Score.create(:hole_id => i, :match_id => id, :golfer_id => golfer.id)
        i += 1
      end
    end
  end

  def create_back_side_scores
    golfers.each do |golfer|
      i = 10
      9.times do
        Score.create(:hole_id => i, :match_id => id, :golfer_id => golfer.id)
        i += 1
      end
    end
  end

  def calculate_handicap_strokes
    first_golfer_handicap = golfers[0].handicap.score
    second_golfer_handicap = golfers[1].handicap.score

    if first_golfer_handicap > second_golfer_handicap
      golfer_handicap_strokes = first_golfer_handicap - second_golfer_handicap
      golfer_receiving_strokes = Golfer.find(golfers[0].id)
    else
      golfer_handicap_strokes = second_golfer_handicap - first_golfer_handicap
      golfer_receiving_strokes = Golfer.find(golfers[1].id)
    end

    if is_front_side
      holes = Hole.front_side_holes.order('handicap asc').limit(golfer_handicap_strokes)
    else
      holes = Hole.back_side_holes.order('handicap asc').limit(golfer_handicap_strokes)
    end

    holes.each do |hole|
      score = Score.where('hole_id = ? and match_id = ? and golfer_id = ?', hole.id, id, golfer_receiving_strokes.id).first
      score.handicap_strokes = 1
      score.save
    end
  end

end
