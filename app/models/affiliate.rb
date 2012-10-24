class Affiliate < ActiveRecord::Base
  attr_accessible :institution_id, :period_number, :period_time_id, :person_id, :program_id, :public_target_id,:institution, :person
  has_many :benefits
  belongs_to :person
  belongs_to :institution
  accepts_nested_attributes_for :person
  accepts_nested_attributes_for :benefits
  accepts_nested_attributes_for :institution
end
