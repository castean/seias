class Affiliate < ActiveRecord::Base
  before_create :check_affiliate

  has_many :benefits
  belongs_to :person
  belongs_to :institution
  belongs_to :period_time
  belongs_to :activity_type

  attr_accessible :person_id, :institution_id, :activity_type_id , :period_time_id, :period_number, :institution_ben_id,:office_id,:program_id,:type
  attr_accessor  :program_id,:type

  validates :institution_id, :presence => true
  validates :activity_type_id, :presence => true
  validates :period_time_id, :presence => true
  validates :period_number, :presence => true
  validates :office_id, :presence => true

  def check_affiliate
    affiliate = Affiliate.find_all_by_person_id_and_activity_type_id(self.person_id, self.activity_type_id)
    if affiliate
      return true
    else
      return false
    end
  end
end
