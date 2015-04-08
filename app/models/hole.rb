class Hole < ActiveRecord::Base
  attr_accessible :course_id, :number, :par, :yards

  has_one :score

end
