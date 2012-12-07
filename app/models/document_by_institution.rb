class DocumentByInstitution < ActiveRecord::Base
  belongs_to :documentation
  belongs_to :institution
  belongs_to :one_reg_institution

  has_attached_file :avatar, :styles => { :medium => "100x100>", :thumb => "52x52>" }
  has_attached_file :attach

  attr_accessible :avatar, :documentation_id, :institution_id, :one_reg_institution_id, :attach



end
