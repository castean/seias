class CreateOneRegInstitutions < ActiveRecord::Migration
  def change
    create_table :one_reg_institutions do |t|
      t.integer :institution_id
      t.boolean :according_social_purpose
      t.integer :people_sex
      t.integer :min_age
      t.integer :max_age
      t.integer :capacity
      t.integer :public_target_id
      t.integer :operation_status

      t.timestamps
    end
  end
end
