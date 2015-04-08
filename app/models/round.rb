class Round < ActiveRecord::Base
  attr_accessible :course_id, :date, :number

  has_and_belongs_to_many :teams
  has_many :matches
end
