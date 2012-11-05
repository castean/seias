class Affiliate < ActiveRecord::Base
  has_many :benefits
  belongs_to :person
  belongs_to :institution
  belongs_to :period_time
  belongs_to :activity_type

  attr_accessible :period_number, :period_time_id, :person_id, :program_id, :public_target_id,
                  :institution_id, :activity_type_id
  attr_accessor :program_id, :activity_type_id, :person_id
end
