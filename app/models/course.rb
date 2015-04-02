class Course < ActiveRecord::Base
  attr_accessible :address, :city, :name, :phone, :state, :zip_code
end
