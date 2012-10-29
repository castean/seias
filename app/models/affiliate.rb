class Affiliate < ActiveRecord::Base
  attr_accessible :institution_id, :period_number, :period_time_id, :person_id, :program_id, :public_target_id,:institution, :person
  has_many :benefits
  has_many :person
  has_many :institution

end
