class Direction < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :departments
end
