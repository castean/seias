class Sex < ActiveRecord::Base
  attr_accessible :name

  #has_many :people , :foreign_key => "sex"
  has_many :one_reg_institutions

end
