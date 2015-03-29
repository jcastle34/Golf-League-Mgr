class League < ActiveRecord::Base
  attr_accessible :name, :year

  has_and_belongs_to_many :golfers

end
