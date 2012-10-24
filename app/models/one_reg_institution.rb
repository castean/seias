#encoding:utf-8
class OneRegInstitution < ActiveRecord::Base
  MAX_AGE = (0..100)
  MIN_AGE = (0..100)
  belongs_to :institution
  belongs_to :public_target
  belongs_to :sex, :foreign_key => "people_sex"
  has_and_belongs_to_many :discapacities
  attr_accessible :according_social_purpose, :capacity, :institution_id, :max_age, :min_age, :operation_status, :people_sex, :public_target_id, :selectLeft, :selectRight

  attr_accessor :selectRight, :selectLeft


  def selectRight=(options)

    self.discapacities.clear

    options.each do |option|
      unless option.empty?
        line = Discapacity.find(option)
        self.discapacities << line
      end
    end
  end


end
