class Hole < ActiveRecord::Base
  attr_accessible :course_id, :number, :par, :yards

  has_one :score

  def self.front_side_holes
    Hole.where('number < 10')
  end

  def self.back_side_holes
    Hole.where('number > 9')
  end

end
