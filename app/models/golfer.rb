class Golfer < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :user_id

  belongs_to :user
  has_and_belongs_to_many :leagues
  has_and_belongs_to_many :teams
  has_and_belongs_to_many :matches
  has_many :scores
  has_many :handicaps

  def full_name
    "#{first_name} #{last_name}"
  end

end
