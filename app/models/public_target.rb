class PublicTarget < ActiveRecord::Base
  has_many :one_reg_institutions
  attr_accessible :description, :name
end
