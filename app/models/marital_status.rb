class MaritalStatus < ActiveRecord::Base
  has_many :persons
  attr_accessible :name
end
