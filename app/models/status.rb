class Status < ActiveRecord::Base
  has_many :offices
  attr_accessible :name
end
