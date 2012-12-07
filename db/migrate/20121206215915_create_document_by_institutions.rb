class CreateDocumentByInstitutions < ActiveRecord::Migration
  def change
    create_table :document_by_institutions do |t|
      t.integer :documentation_id
      t.integer :one_reg_institution_id
      t.integer :institution_id
      t.has_attached_file :avatar

      t.timestamps
    end
  end
end
