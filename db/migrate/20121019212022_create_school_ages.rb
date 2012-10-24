class CreateSchoolAges < ActiveRecord::Migration
  def change
    create_table :school_ages do |t|
      t.integer :institution_id
      t.integer :grade_id
      t.integer :guardianship_id
      t.integer :sex_id
      t.integer :total_qty_registered
      t.integer :real_qty_registered

      t.timestamps
    end
  end
end
