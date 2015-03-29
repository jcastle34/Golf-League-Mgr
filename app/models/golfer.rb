class Golfer < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :user_id

  belongs_to :user
  has_and_belongs_to_many :leagues

  def full_name
    "#{first_name} #{last_name}"
  end

end
