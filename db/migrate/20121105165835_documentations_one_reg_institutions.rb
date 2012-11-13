class DocumentationsOneRegInstitutions < ActiveRecord::Migration
  def change
    create_table :documentations_one_reg_institutions, :id => false do |t|
      t.integer :documentation_id
      t.integer :one_reg_institution_id
    end
  end
end
