class CreateFatherInstitutions < ActiveRecord::Migration
  def change
    create_table :father_institutions, :id => false do |t|
      t.integer :institution_id
      t.integer :father_institution_id
    end
  end
end
