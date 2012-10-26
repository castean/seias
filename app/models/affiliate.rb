class Affiliate < ActiveRecord::Base
  attr_accessible :institution_id, :period_number, :period_time_id, :person_id, :program_id, :public_target_id,
                  :institution, :person, :program_id
  attr_accessor :program_id
  has_many :benefits
  has_many :person
  has_many :institution

end
