class Department < ActiveRecord::Base
  belongs_to :direction
  # attr_accessible :title, :body
end
