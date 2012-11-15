#encoding:utf-8
class SchoolAge < ActiveRecord::Base
  belongs_to :institution
  belongs_to :grade
  belongs_to :guardianship
  belongs_to :sex
  attr_accessible :grade_id, :guardianship_id, :institution_id, :real_qty_registered, :sex_id, :total_qty_registered
end
