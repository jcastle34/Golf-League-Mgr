class Team < ActiveRecord::Base
  attr_accessible :league_id, :name

  belongs_to :league
  has_and_belongs_to_many :rounds
  has_and_belongs_to_many :golfers

end
