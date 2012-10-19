class Discapacity < ActiveRecord::Base
  has_and_belongs_to_many :one_reg_institutions
  has_and_belongs_to_many :institutions
  attr_accessible :name
end
