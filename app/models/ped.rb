class Ped < ActiveRecord::Base
  attr_accessible :date_end, :date_start, :description, :name
  has_many :ped_goals
end
