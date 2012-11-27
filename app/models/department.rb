class Department < ActiveRecord::Base
  belongs_to :direction
  has_many :programs
  has_many :offices
  has_many :critical_success_factors
  belongs_to :user
  has_many :users


  attr_accessible :name, :direction_id, :user_id

  before_destroy :check_for_dependencias


  validates :name, :presence => true
  validates :user_id, :presence => true
  validates :direction_id, :presence => true

  def check_for_dependencias
    if programs.count > 0 and critical_success_factors.count > 0
      errors.add_to_base("No se pueden borrar mientras tenga dependencias")
      return false
    end
  end
end
