class Affiliate < ActiveRecord::Base
  has_many :benefits
  belongs_to :person
  belongs_to :institution
  belongs_to :period_time
  belongs_to :activity_type

  attr_accessible :person_id, :institution_id, :activity_type_id , :period_time_id, :period_number, :institution_ben_id,:office_id,:program_id,:field, :ben_aff
  attr_accessor  :program_id,:field, :ben_aff

  validates :institution_id, :presence => true
  validates :activity_type_id, :presence => true
  validates :period_time_id, :presence => true
  validates :period_number, :presence => true
  validates :office_id, :presence => true
end
